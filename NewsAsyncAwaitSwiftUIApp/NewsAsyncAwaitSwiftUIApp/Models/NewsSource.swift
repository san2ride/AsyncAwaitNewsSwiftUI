//
//  NewsSource.swift
//  NewsAsyncAwaitSwiftUIApp
//
//  Created by don't touch me on 2/7/24.
//

import Foundation

struct NewsSourceResponse: Decodable {
    let sources: [NewsSource]
}

struct NewsSource: Decodable {
    let id: String
    let name: String
    let description: String
}
