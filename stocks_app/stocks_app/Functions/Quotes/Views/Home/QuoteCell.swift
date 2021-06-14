//
//  stocks_appApp.swift
//  QuoteCell
//
//  Created by Ivan Vislov on 23.03.2021.
//

import SwiftUI
import SwiftUICharts

struct QuoteCell: View {
    var quote: Quote
    
    var body: some View {
        
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 16.0)
                    .fill(Color("Color4"))
                HStack {
                    
                    HStack {
                        Text(quote.symbol)
                            .font(.custom("Montserrat-SemiBold",size: 22))
                            .foregroundColor(.black)
                        Image(systemName: "star.fill")
                            .foregroundColor(Color(#colorLiteral(red: 0.96929425, green: 0.7646276355, blue: 0.1138446704, alpha: 1)))
                    }
                    
                    Spacer()
                    
                    Spacer()
                    
                    VStack(alignment: .trailing){
                        HStack(spacing: 0) {
                            Text("$")
                                .foregroundColor(.black)
                                .font(.custom("Montserrat-SemiBold",size: 22))

                            Text(quote.price.prefix(6))
                                .font(.custom("Montserrat-SemiBold",size: 22))
                                .foregroundColor(.black)
                        }

                        VStack(alignment: .trailing){
                            HStack(spacing: 0) {
                                Text("$")
                                Text(quote.change.prefix(5))
                            }
                            Text(quote.changePercent.prefix(5))
                            
                        }
                        .lineLimit(0)

                            .font(.custom("Montserrat-Medium",size: 15))
                            .foregroundColor((Double(quote.change)! > 0.0 ? Color.green : Color(#colorLiteral(red: 0.7039875388, green: 0.1401753724, blue: 0.1417259872, alpha: 1))))

                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 5)
            }
        }
        .padding(.vertical, 5)
    }
}

struct QuoteCell_Previews: PreviewProvider {
    static var previews: some View {
        QuoteCell(quote: Quote(symbol: "AAPL", open: "135.22", high: "140.22", low: "130.21", price: "135.12", change: "-0.12", changePercent: "-0.098%"))
    }
}


