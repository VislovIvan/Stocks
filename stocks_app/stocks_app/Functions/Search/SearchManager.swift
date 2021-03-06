//
//  stocks_appApp.swift
//  SearchManager
//
//  Created by Ivan Vislov on 23.03.2021.
//

import Foundation

final class SearchManager: ObservableObject {
    @Published var searches = [Search]()
    
    func searchStocks(keyword: String) {
        NetworkManager<SearchResponse>().fetch(from: URL(string: API.symbolSearchUrl(for: keyword))!) { (result) in
            switch result {
            case .failure(let err):
                print(err)
            case .success(let resp):
                DispatchQueue.main.async {
                    self.searches = resp.bestMatches
                }
            }
        }
    }
}
