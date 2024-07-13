//
//  FirebaseDatabase.swift
//  F1Superfan
//
//  Created by James Kaddissi on 7/7/24.
//

import Foundation
import Firebase
import FirebaseDatabase

class FirebaseService {
    static let shared = FirebaseService()

    private let database = Database.database()
    private let driverStatsRef: DatabaseReference
    private let newsFeedRef: DatabaseReference

    private init() {
        driverStatsRef = database.reference(withPath: "driverStats")
        newsFeedRef = database.reference(withPath: "newsFeed")
    }
    
    func fetchNewsFeed(completion: @escaping (NewsFeed?) -> Void) {
            newsFeedRef.observeSingleEvent(of: .value) { snapshot in
                guard let value = snapshot.value as? [String: Any] else {
                    completion(nil)
                    return
                }
                
                var newsFeed = NewsFeed(feed: [])
                
                for (_, sourceData) in value {
                    guard let source = sourceData as? [String: [String: [String: String]]] else {
                        continue
                    }
                    
                    for (_, timestampData) in source {
                        for (_, storyData) in timestampData {
                            if let title = storyData["title"],
                               let blurb = storyData["blurb"],
                               let url = storyData["url"] {
                                
                                let components = title.components(separatedBy: ":")
                                let time = components.dropLast().joined(separator: ":")
                                
                                let newsStory = NewsStory(time: time, title: title, blurb: blurb, url: url)
                                newsFeed.feed.append(newsStory)
                            }
                        }
                    }
                }
                
                newsFeed.feed.sort { $0.time > $1.time }
                
                completion(newsFeed)
            }
        }

    func fetchDriverStats(for driverName: String, completion: @escaping (DriverStats?) -> Void) {
        driverStatsRef.child(driverName).observeSingleEvent(of: .value) { snapshot in
            guard let value = snapshot.value as? [String: Any] else {
                completion(nil)
                return
            }

            let podiums = value["podiums"] as? Int ?? 0
            let poles = value["poles"] as? Int ?? 0
            let wdcs = value["wdcs"] as? Int ?? 0
            let wins = value["wins"] as? Int ?? 0
            let height = value["height"] as? Int ?? 0
            let number = value["number"] as? Int ?? 0
            let debutArray = value["debut"] as? [String] ?? []
            let historyArray = value["history"] as? [String] ?? []
            let weight = value["weight"] as? Int ?? 0

            let driverStats = DriverStats(
                podiums: podiums,
                poles: poles,
                wdcs: wdcs,
                wins: wins,
                height: height,
                number: number,
                debut: debutArray,
                history: historyArray,
                weight: weight
            )

            completion(driverStats)
        }
    }
}

struct DriverStats {
    let podiums: Int
    let poles: Int
    let wdcs: Int
    let wins: Int
    let height: Int
    let number: Int
    let debut: [String]
    let history: [String]
    let weight: Int
    
    var heightString: String {
        let feet = height / 12
        let inches = height % 12
        return "\(feet)' \(inches)\""
    }
}

struct NewsStory: Identifiable {
    let id = UUID()
    let time: String
    let title: String
    let blurb: String
    let url: String
}
struct NewsFeed {
    var feed: [NewsStory]
}
