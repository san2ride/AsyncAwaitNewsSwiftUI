//
//  NewsArticleListViewModel.swift
//  NewsAsyncAwaitSwiftUIApp
//
//  Created by don't touch me on 2/7/24.
//

import Foundation

class NewsArticleListViewModel: ObservableObject {
    
    @Published var newsArticles = [NewsArticleViewModel]()
    
    func getNewsBy(sourceId: String) async {
        do {
            let newsArticles = try await WebService().fetchNews(sourceId: sourceId, url: Constants.Urls.topHeadlines(by: sourceId))
            DispatchQueue.main.async {
                newsArticles = newsArticles.map(NewsArticleViewModel.init)
            }
        } catch {
            print(error)
        }
    }
}

struct NewsArticleViewModel {
    let id = UUID()
    fileprivate let newsArticle: NewsArticle
}
