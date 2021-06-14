//
//  stocks_appApp.swift
//  ContentView
//
//  Created by Ivan Vislov on 23.03.2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var stockManager = StockQuoteManager()
    @ObservedObject var newsManager = NewsDownloadManager()
    
    @State private var stocks = UserDefaultsManager.shared.savedSymbols
    @State private var searchTerm = ""
    @State private var newsOpen = false
    @State private var oldStocks = [String]()
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        
        TabView {
            ZStack {
                Color("Color1")
                
                VStack(alignment: .leading, spacing: 10) {
                    HeaderView(stocks: $stocks)
                        .padding(.top, 50)
                    
                    HStack {
                        Text("Favourite")
                            .foregroundColor(Color("Color2"))
                            .font(.custom("Montserrat-SemiBold",size: 25))
                    }
                    
                    List {
                        Group {
                            SearchTextView(searchTerm: $searchTerm)
                            ForEach(getQuotes()) { quote in
                                QuoteCell(quote: quote)
                            }
                        }.listRowBackground(Color.clear)
                        .listRowInsets(EdgeInsets())
                    }
                    .onAppear {
                        fetchData(for: stocks)
                        oldStocks = stocks
                    }
                    .onChange(of: stocks, perform: { value in
                        fetchData(for: stocks.difference(from: oldStocks))
                        oldStocks = stocks
                    })
                    .listStyle(PlainListStyle())
                    .foregroundColor(.white)
                }
                .padding(.horizontal, 20)
                
                
            }.edgesIgnoringSafeArea(.all)
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            
            NewsListView(newsManager: newsManager)
                .tabItem {
                    Image(systemName: "newspaper.fill")
                    Text("News")
                }
            Charts()
                .tabItem {
                    Image(systemName: "chart.bar.xaxis")
                    Text("Charts")
                }
        }
    }
    
    private func getQuotes() -> [Quote] {
        return searchTerm.isEmpty ? stockManager.quotes : stockManager.quotes.filter { $0.symbol.lowercased().contains(searchTerm.lowercased()) }
    }
    
    private func fetchData(for symbols: [String]) {
        stockManager.download(stocks: symbols) { _ in
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

