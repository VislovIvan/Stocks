//
//  stocks_appApp.swift
//  NewsSheetView
//
//  Created by Ivan Vislov on 23.03.2021.
//

import SwiftUI

struct NewsSheetView: View {
    @Binding var newsOpen: Bool
    @ObservedObject var newsManager: NewsDownloadManager
    
    init(newsOpen: Binding<Bool>, newsManager: NewsDownloadManager) {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        self._newsOpen = newsOpen
        self.newsManager = newsManager
    }
    
    var body: some View {
            ZStack {
                Color.white
                Rectangle().fill(Color.black.opacity(0.8))
                
                VStack(alignment: .leading) {
                    NewsHeaderView()
                    Spacer()
                    NewsListView(newsManager: newsManager)
                }.padding()
            }
    }
}
