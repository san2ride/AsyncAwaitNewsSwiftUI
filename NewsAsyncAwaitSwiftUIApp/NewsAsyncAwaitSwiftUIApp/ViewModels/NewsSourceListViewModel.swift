//
//  NewsSourceListViewModel.swift
//  NewsAsyncAwaitSwiftUIApp
//
//  Created by don't touch me on 2/7/24.
//

import Foundation

class NewsSourceListViewModel: ObservableObject {
    @Published var newsSources: [NewsSourceViewModel] = []
    
    func getSources() async {
        do {
            let newsSources = try await WebService().fetchSources(url: Constants.Urls.sources)
            DispatchQueue.main.async {
                self.newsSources = newsSources.map(NewsSourceViewModel.init)
            }
        } catch {
            print(error)
        }
        
        /*
        WebService().fecthSources(url: Constants.Urls.sources) { result in
            switch result {
                case .success(let newsSources):
                    DispatchQueue.main.async {
                        self.newsSources = newsSources.map(NewsSourceViewModel.init)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }*/
    }
}

struct NewsSourceViewModel {
    fileprivate var newsSource: NewsSource
    
    var id: String {
        newsSource.id
    }
    
    var name: String {
        newsSource.name
    }
    
    var description: String {
        newsSource.description
    }
    
    static var `default` : NewsSourceViewModel {
        let newsSource = NewsSource(id: "abc-news",
                                    name: "ABC News",
                                    description: "This is ABC news")
        return NewsSourceViewModel(newsSource: newsSource)
    }
}
