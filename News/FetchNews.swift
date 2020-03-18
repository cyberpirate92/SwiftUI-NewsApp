//
//  FetchNews.swift
//  News
//
//  Created by Ravi Theja on 17/03/20.
//  Copyright © 2020 Idlebrains. All rights reserved.
//

import Foundation

class NewsApi {
    
    static let DEFAULT_COUNTRY = "in"
    static let DEFAULT_CATEGORY = "general"
    static let DEFAULT_PAGE_SIZE = 100
    
    static func getApiUrl() -> String {
        return "https://newsapi.org/v2/top-headlines"
    }
    
    static func fetchTopHeadlines(completion: @escaping (TopHeadlinesResponse?) -> Void) {
        let session = URLSession.shared
        var urlComponents = URLComponents(string: getApiUrl())!
        urlComponents.queryItems = [
            URLQueryItem(name: "country", value: DEFAULT_COUNTRY),
            URLQueryItem(name: "category", value: DEFAULT_CATEGORY),
            URLQueryItem(name: "pageSize", value: "\(DEFAULT_PAGE_SIZE)"),
            URLQueryItem(name: "apikey", value: NEWS_API_KEY)
        ]
        
        let task = session.dataTask(with: urlComponents.url!) { data, response, error in
            
            if error != nil || data == nil {
                print("Client error!")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }
            
            guard let mime = response.mimeType, mime == "application/json" else {
                print("Wrong MIME type!")
                return
            }
            
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .iso8601
            let topHeadlinesResponse = try? jsonDecoder.decode(TopHeadlinesResponse.self, from: data!)
            if (topHeadlinesResponse != nil) {
                print("Number of news articles = \(topHeadlinesResponse?.totalResults ?? -1)")
            } else {
                print("JSON deserialization failed :(")
            }
            completion(topHeadlinesResponse)
        }
        task.resume()
    }
}
