//
//  NewsItem.swift
//  News
//
//  Created by Ravi Theja on 17/03/20.
//  Copyright © 2020 Idlebrains. All rights reserved.
//

import Foundation

// MARK: - TopHeadlinesResponse
struct TopHeadlinesResponse: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let source: Source?
    let author, title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: Date?
    let content: String?
}

// MARK: - Source
struct Source: Codable {
    let id: String?, name: String?
}
