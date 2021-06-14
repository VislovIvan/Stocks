//
//  stocks_appApp.swift
//  QuoteManagerProtocol
//
//  Created by Ivan Vislov on 23.03.2021.
//

import Foundation

protocol QuoteManagerProtocol {
    var quotes: [Quote] { get set }
    func download(stocks: [String], completion: @escaping (Result<[Quote], NetworkError>) -> Void)
}

