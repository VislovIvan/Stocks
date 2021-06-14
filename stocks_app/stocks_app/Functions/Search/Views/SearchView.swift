//
//  stocks_appApp.swift
//  SearchView
//
//  Created by Ivan Vislov on 23.03.2021.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchTerm: String = ""
    
    @ObservedObject var searchManager = SearchManager()
    
    var body: some View {
        ZStack {
            Color("Color6")
            VStack {
                HStack {
                    Text("Find company and add to favourite")
                        .font(.custom("Montserrat-SemiBold",size: 22))
                        .foregroundColor(Color("Color5"))
                    Spacer()
                }
                .padding(.leading, 15)
                HStack {
                    SearchTextView(searchTerm: $searchTerm)
                    Button(action: {
                        searchManager.searchStocks(keyword: searchTerm)
                    }) {
                        Image(systemName: "magnifyingglass.circle.fill")
                            .font(.title)
                            .foregroundColor(Color("Color5"))
                    }
                }
                Spacer()
                
                ScrollView(showsIndicators: false) {
                    ForEach(searchManager.searches) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.symbol)
                                    .font(.title)
                                    .bold()
                                
                                Text(item.type)
                                    .font(.body)
                            }
                            Spacer()
                            Text(item.name)
                            Spacer()
                            Button(action: {
                                UserDefaultsManager.shared.set(symbol: item.symbol)
                            }) {
                                Image(systemName: "bookmark.circle")
                                    .font(.title)
                            }
                        }.foregroundColor(Color("Color5"))
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .frame(height: 1)
                    }
                }
            }
            .padding(.top, 15)
            .padding(.horizontal, 16)
            
        }.edgesIgnoringSafeArea(.all)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
