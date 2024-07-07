//
//  BackendManager.swift
//  F1Superfan
//
//  Created by James Kaddissi on 7/6/24.
//

import Foundation
import MongoSwift


let uri = "mongodb+srv://jameskaddissi:YLOEM3bqwhHoDZIX@f1superfantest.ealcfz2.mongodb.net/f1superfan?retryWrites=true&w=majority"

guard let client = try? MongoClient(uri) else {
    fatalError("Failed to connect to MongoDB")
}

let database = client.db("F1Superfan")
let collection = database.collection("driverStats")
public func getWins(name: String) -> [Document] {
    let query: Document = ["driverName": name]
    do {
        let result = try collection.find(query)
        return Array(result)
    } catch {
        print("Error retrieving data: \(error)")
        return []
    }
}
