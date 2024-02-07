//
//  Constants.swift
//  NewsAsyncAwaitSwiftUIApp
//
//  Created by don't touch me on 2/7/24.
//

import Foundation

struct Constants {
    struct Urls {
        
        static func topHeadlines(by source: String) -> URL? {
            return URL(string:
                "https://newsapi.org/v2/top-headlines?sources=\(source)&apiKey=f2aa4d0b938148e2bb77855390c8cd5c")
        }
        
        static let sources: URL? = URL(string:
            "https://newsapi.org/v2/sources?apiKey=f2aa4d0b938148e2bb77855390c8cd5c")
    }
}
