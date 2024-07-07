import Foundation
import SwiftUI
// for temporary dev purposes only, real news tab will require a new custom backend database and api
private let rapidApiKey = "d719d0e705mshc4ad0f1571620dfp1b65aejsned969c3b1b7f"
private let rapidApiHost = "f1-latest-news.p.rapidapi.com"

struct NewsResponse: Codable {
    let data: [NewsStory]
}

struct NewsStory: Codable, Identifiable {
    let id = UUID()
    let title: String
    let url: String
    let source: String
}

class NewsManager: ObservableObject {
    @Published var articles: [NewsStory] = []
    
    func fetchF1News(apiKey: String) {
        guard let url = URL(string: "https://f1-latest-news.p.rapidapi.com/news") else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("d719d0e705mshc4ad0f1571620dfp1b65aejsned969c3b1b7f", forHTTPHeaderField: "x-rapidapi-key")
        request.setValue("f1-latest-news.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error fetching F1 news: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received from F1 news API")
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode([NewsStory].self, from: data)
                DispatchQueue.main.async {
                    self.articles = decodedResponse
                }
            } catch {
                print("Error decoding F1 news JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}


struct NewsTabView: View {
    @StateObject var newsManager = NewsManager()
    
    var body: some View {
        NavigationView {
            List(newsManager.articles) { article in
                NavigationLink(destination: Text("News")) {
                    VStack(alignment: .leading) {
                        Text(article.title)
                            .font(.headline)
                        Text(article.source)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("F1 News")
            .onAppear {
                newsManager.fetchF1News(apiKey: "d719d0e705mshc4ad0f1571620dfp1b65aejsned969c3b1b7f")
            }
        }
    }
}
