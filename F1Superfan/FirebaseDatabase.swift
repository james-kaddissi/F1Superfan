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

    private init() {
        driverStatsRef = database.reference(withPath: "driverStats")
    }

    func fetchDriverStats(for driverName: String, completion: @escaping (DriverStats?) -> Void) {
        driverStatsRef.child(driverName).observeSingleEvent(of: .value) { snapshot in
            guard let value = snapshot.value as? [String: Any] else {
                completion(nil)
                return
            }

            let driverStats = DriverStats(
                podiums: value["podiums"] as? Int ?? 0,
                poles: value["poles"] as? Int ?? 0,
                wdcs: value["wdcs"] as? Int ?? 0,
                wins: value["wins"] as? Int ?? 0
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
}
