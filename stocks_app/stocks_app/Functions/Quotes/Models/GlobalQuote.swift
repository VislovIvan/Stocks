//
//  stocks_appApp.swift
//  GlobalQuote
//
//  Created by Ivan Vislov on 23.03.2021.
//

import Foundation

struct GlobalQuoteResponse: Codable {
    var quote: Quote
    
    private enum CodingKeys: String, CodingKey {
        case quote = "Global Quote"
    }
}
