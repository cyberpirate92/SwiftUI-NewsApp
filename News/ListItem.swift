//
//  ListItem.swift
//  News
//
//  Created by Ravi Theja on 17/03/20.
//  Copyright © 2020 Idlebrains. All rights reserved.
//

import Foundation

struct ListItem: Identifiable {
    var id: UUID
    var name: String
    var description: String
    var isFavorite: Bool
    var imageUrl: URL
    var date: Date?
    var sourceWebsite: String?
    var body: String?
    var articleUrl: String
    
    var debugDescription: String {
        return "Name: \(self.name) | Favorite?: \(self.isFavorite)"
    }
    
    public init(articleUrl: String, name: String, imageUrl: String? = nil, description: String? = nil, date: Date? = nil, source: String? = nil, body: String? = nil) {
        self.articleUrl = articleUrl
        self.name = name
        id = UUID()
        self.description = description ?? "No description provided"
        self.isFavorite = false
        let articleImageUrl = imageUrl ?? "https://google.com"
        self.imageUrl = URL(string: articleImageUrl)!
        self.date = date
        self.sourceWebsite = source
        self.body = body
    }
}

class ListItems: ObservableObject {
    @Published var items: [ListItem]
    
    public init() {
        self.items = []
    }
    
    public func fetch() {
        NewsApi.fetchTopHeadlines {
            if ($0 != nil && $0?.status == "ok") {
                $0?.articles.forEach {
                    article in
                    DispatchQueue.main.async {
                        self.items.append(ListItem(articleUrl: article.url ?? "", name: article.title!, imageUrl: article.urlToImage, description: article.description, date: article.publishedAt, source: article.source?.name, body: article.content))
                    }
                }
            } else {
                print("API Request failed")
            }
        }
    }
}
