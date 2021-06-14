//
//  stocks_appApp.swift
//  NewsDownloadManager
//
//  Created by Ivan Vislov on 23.03.2021.
//

import Foundation

final class NewsDownloadManager: ObservableObject {
    @Published var newsArticles = [News]()

    private let newsUrlString = "https://newsapi.org/v2/everything?q=apple&from=2021-03-26&to=2021-03-26&sortBy=popularity&apiKey=\(NewsAPI.key)"

    init() {
        download()
    }

    func download() {
        NetworkManager<NewsResponse>().fetch(from: URL(string: newsUrlString)!) { (result) in
            switch result {
            case .failure(let err):
                print(err)
            case .success(let resp):
                DispatchQueue.main.async {
                    self.newsArticles = resp.articles
                }
            }
        }
    }
}
