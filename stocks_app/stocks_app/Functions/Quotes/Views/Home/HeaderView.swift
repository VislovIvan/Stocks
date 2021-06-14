//
//  stocks_appApp.swift
//  HeaderView
//
//  Created by Ivan Vislov on 23.03.2021.
//

import SwiftUI

struct HeaderView: View {
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd"
        return formatter
    }()
    
    @Binding var stocks: [String]
    
    @State private var showSearch = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: -5) {
                Text("Stocks")
                    .foregroundColor(Color("Color2"))
                    .font(.custom("Montserrat-SemiBold",size: 32))

                Text("\(Date(), formatter: dateFormatter)")
                    .foregroundColor(.gray)
                    .font(.custom("Montserrat-SemiBold",size: 25))
            }
            
            Spacer()
            
            Button {
                showSearch.toggle()
            } label: {
                Image(systemName: "plus")
                    .font(.title)
                    .foregroundColor(Color("Color5"))
            }.sheet(isPresented: $showSearch, onDismiss: {
                self.stocks = UserDefaultsManager.shared.savedSymbols
            }, content: {
                SearchView()
            })
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(stocks: .constant(["AAPL", "GOOG"]))
    }
}
