//
//  NewsTabView.swift
//  F1Superfan
//
//  Created by James Kaddissi on 7/3/24.
//

import Foundation
import SwiftUI

private var newsApiKey: String = "485jeAGuHZBWKDJMYqEDebcCNM2Q0PKnvJeJ3jLk"

struct NewsResponse: Codable {
    let meta: MetaData
    let data: [NewsArticle]
}

struct MetaData: Codable {
    let found: Int
    let returned: Int
    let limit: Int
    let page: Int
}

struct NewsArticle: Codable, Identifiable {
    let id: String
    let title: String
    let description: String?
    let snippet: String
    let url: String
    let image_url: String?
    let published_at: String
    let source: String
    let categories: [String]
}

class NewsManager: ObservableObject {
    @Published var articles: [NewsArticle] = []
    
    func fetchF1News(apiToken: String) {
        guard let url = URL(string: "https://api.thenewsapi.com/v1/news/all?api_token=\(apiToken)&categories=sports&search=F1") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
                DispatchQueue.main.async {
                    self.articles = decodedResponse.data
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}
struct NewsTabView: View {
    @StateObject var newsManager = NewsManager()
    let apiToken = "485jeAGuHZBWKDJMYqEDebcCNM2Q0PKnvJeJ3jLk"
    
    var body: some View {
        NavigationView {
                    List(newsManager.articles) { article in
                        NavigationLink(destination: Text("News")) {
                            VStack(alignment: .leading) {
                                Text(article.title)
                                    .font(.headline)
                                Text(article.description ?? "")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .navigationTitle("F1 News")
                    .onAppear {
                        newsManager.fetchF1News(apiToken: apiToken)
                    }
                }
    }
}
