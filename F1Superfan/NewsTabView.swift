import Foundation
import SwiftUI

class NewsManager: ObservableObject {
    @Published var articles: [NewsStory] = []
    
    func fetchF1News() {
        FirebaseService.shared.fetchNewsFeed { newsFeed in
            guard let newsFeed = newsFeed else {
                
                return
            }
            
            DispatchQueue.main.async {
                self.articles = newsFeed.feed
            }
        }
    }
}

struct NewsTabView: View {
    @StateObject var newsManager = NewsManager()
    
    var body: some View {
        NavigationView {
            List(newsManager.articles) { article in
                NavigationLink(destination: Text("News Detail View")) {
                    VStack(alignment: .leading) {
                        Text(article.title)
                            .font(.headline)
                        Text(article.blurb)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("F1 News")
            .onAppear {
                newsManager.fetchF1News()
            }
        }
    }
}
