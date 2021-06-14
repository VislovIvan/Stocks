//
//  stocks_appApp.swift
//  Charts
//
//  Created by Ivan Vislov on 23.03.2021.
//

import SwiftUICharts
import SwiftUI

struct Charts: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(spacing: 380) {
                    AppleStocks()
                    TeslaStocks()
                    YandexStocks()
                    BAC()
                    GameStop()
                }
                .padding(.bottom, 400)
                .navigationBarTitle("Charts", displayMode: .large)
            }
        }
    }
}

struct Charts_Previews: PreviewProvider {
    static var previews: some View {
        Charts()
    }
}
  

struct AppleStocks: View {
    var body: some View {
        VStack {
            LineView(
                data: [73, 79, 91, 106, 129, 115, 108, 119, 132, 131, 121, 121, 121], title: "Apple Inc.",  legend: "1Y", style: ChartStyle(backgroundColor: .white, accentColor: Color("Color2"), secondGradientColor: Color("Color2"), textColor: .black, legendTextColor: .black, dropShadowColor: Color.black.opacity(0.7))
            )
            
        }
        .padding(.horizontal, 30)
    }
}

struct TeslaStocks: View {
    var body: some View {
        VStack {
            LineView(
                data: [100, 151, 171, 216, 289, 502, 440, 394, 597, 719, 814, 690, 641], title: "Tesla Motors.",  legend: "1Y", style: ChartStyle(backgroundColor: .white, accentColor: Color("Color2"), secondGradientColor: Color("Color2"), textColor: .black, legendTextColor: .black, dropShadowColor: Color.black.opacity(0.7))
            )
            
        }
        .padding(.horizontal, 30)
    }
}

struct YandexStocks: View {
    var body: some View {
        VStack {
            LineView(
                data: [33, 37, 40, 49, 58, 68, 65, 57, 69, 70, 62, 65, 63], title: "Yandex, LLC",  legend: "1Y", style: ChartStyle(backgroundColor: .white, accentColor: Color("Color2"), secondGradientColor: Color("Color2"), textColor: .black, legendTextColor: .black, dropShadowColor: Color.black.opacity(0.7))
            )
            
        }
        .padding(.horizontal, 30)
    }
}

struct BAC: View {
    var body: some View {
        VStack {
            LineView(
                data: [19, 23, 24, 24, 25, 25, 24, 23, 28, 30, 29, 35, 38], title: "Bank of America Corp",  legend: "1Y", style: ChartStyle(backgroundColor: .white, accentColor: Color("Color2"), secondGradientColor: Color("Color2"), textColor: .black, legendTextColor: .black, dropShadowColor: Color.black.opacity(0.7))
            )
            
        }
        .padding(.horizontal, 30)
    }
}

struct GameStop: View {
    var body: some View {
        VStack {
            LineView(
                data: [3, 5, 4, 4, 4, 7, 10, 10, 17, 19, 316, 104, 197], title: "GameStop Corp",  legend: "1Y", style: ChartStyle(backgroundColor: .white, accentColor: Color("Color2"), secondGradientColor: Color("Color2"), textColor: .black, legendTextColor: .black, dropShadowColor: Color.black.opacity(0.7))
            )
            
        }
        .padding(.horizontal, 30)
    }
}
