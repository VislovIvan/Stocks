//
//  stocks_appApp.swift
//  ChartData
//
//  Created by Ivan Vislov on 23.03.2021.
//

import SwiftUI
import Foundation

struct ChartData: Identifiable {
    let imageName: String
    let name: String
    let id = UUID()
}

let charts = [
    ChartData(imageName: "AAPL", name: "AAPL"),
    ChartData(imageName: "BAC", name: "BAC"),
    ChartData(imageName: "TSLA", name: "TSLA"),
    ChartData(imageName: "YNDX", name: "YNDX")
]
