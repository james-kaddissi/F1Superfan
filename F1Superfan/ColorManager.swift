//
//  ColorManager.swift
//  F1Superfan
//
//  Created by James Kaddissi on 7/3/24.
//

import Foundation
import SwiftUI

public func teamColor(for favoriteDriver: String) -> Color {
    switch favoriteDriver.lowercased() {
    case "hamilton", "russell":
        return Color(red: 0, green: 0.63, blue: 0.60)
    case "leclerc", "sainz":
        return Color(red: 0.65, green: 0.02, blue: 0.10)
    case "verstappen", "perez":
        return Color(red: 0.11, green: 0.12, blue: 0.27)
    case "alonso", "stroll":
        return Color(red: 0, green: 0.35, blue: 0.31)
    case "norris", "piastri":
        return Color(red: 1, green: 0.50, blue: 0)
    case "gasly", "ocon":
        return Color(red: 0, green: 0.47, blue: 0.76)
    case "albon", "sargeant":
        return Color(red: 0.02, green: 0.12, blue: 0.26)
    case "bottas", "zhou":
        return Color(red: 0, green: 0.91, blue: 0.20)
    case "magnussen", "hulkenberg":
        return Color(red: 0.97, green: 0.13, blue: 0.22)
    case "ricciardo", "tsunoda":
        return Color(red: 0.02, green: 0.12, blue: 0.24)
    default:
        return .red
    }
}
