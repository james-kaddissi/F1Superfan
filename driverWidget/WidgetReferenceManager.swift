//
//  ReferenceManager.swift
//  F1Superfan
//
//  Created by James Kaddissi on 7/10/24.
//

import Foundation
import SwiftUI



public func wteamColor(for favoriteDriver: String) -> Color {
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


public func wfullName(for favoriteDriver: String) -> String {
    switch favoriteDriver.lowercased() {
    case "hamilton":
        return "Lewis Hamilton"
    case "russell":
        return "George Russell"
    case "leclerc":
        return "Charles Leclerc"
    case "sainz":
        return "Carlos Sainz"
    case "verstappen":
        return "Max Verstappen"
    case "perez":
        return "Sergio Perez"
    case "alonso":
        return "Fernando Alonso"
    case "stroll":
        return "Lance Stroll"
    case "norris":
        return "Lando Norris"
    case "piastri":
        return "Oscar Piastri"
    case "gasly":
        return "Pierre Gasly"
    case "ocon":
        return "Esteban Ocon"
    case "albon":
        return "Alex Albon"
    case "sargeant":
        return "Logan Sargeant"
    case "bottas":
        return "Valtteri Bottas"
    case "zhou":
        return "Guanyu Zhou"
    case "magnussen":
        return "Kevin Magnussen"
    case "hulkenberg":
        return "Nico Hulkenberg"
    case "ricciardo":
        return "Daniel Ricciardo"
    case "tsunoda":
        return "Yuki Tsunoda"
    default:
        return "Unknown"
    }
}
public func wfirstName(for favoriteDriver: String) -> String {
    switch favoriteDriver.lowercased() {
    case "hamilton":
        return "Lewis"
    case "russell":
        return "George"
    case "leclerc":
        return "Charles"
    case "sainz":
        return "Carlos"
    case "verstappen":
        return "Max"
    case "perez":
        return "Sergio"
    case "alonso":
        return "Fernando"
    case "stroll":
        return "Lance"
    case "norris":
        return "Lando"
    case "piastri":
        return "Oscar"
    case "gasly":
        return "Pierre"
    case "ocon":
        return "Esteban"
    case "albon":
        return "Alex"
    case "sargeant":
        return "Logan"
    case "bottas":
        return "Valtteri"
    case "zhou":
        return "Guanyu"
    case "magnussen":
        return "Kevin"
    case "hulkenberg":
        return "Nico"
    case "ricciardo":
        return "Daniel"
    case "tsunoda":
        return "Yuki"
    default:
        return ""
    }
}

public func wlastName(for favoriteDriver: String) -> String {
    switch favoriteDriver.lowercased() {
    case "hamilton":
        return "Hamilton"
    case "russell":
        return "Russell"
    case "leclerc":
        return "Leclerc"
    case "sainz":
        return "Sainz"
    case "verstappen":
        return "Verstappen"
    case "perez":
        return "Perez"
    case "alonso":
        return "Alonso"
    case "stroll":
        return "Stroll"
    case "norris":
        return "Norris"
    case "piastri":
        return "Piastri"
    case "gasly":
        return "Gasly"
    case "ocon":
        return "Ocon"
    case "albon":
        return "Albon"
    case "sargeant":
        return "Sargeant"
    case "bottas":
        return "Bottas"
    case "zhou":
        return "Zhou"
    case "magnussen":
        return "Magnussen"
    case "hulkenberg":
        return "Hulkenberg"
    case "ricciardo":
        return "Ricciardo"
    case "tsunoda":
        return "Tsunoda"
    default:
        return ""
    }
}
