//
//  ContentView.swift
//  F1Superfan
//
//  Created by James Kaddissi on 6/27/24.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    @State private var usesTeamColors = true
    @State private var favoriteDriver = "sainz"
    
    @State private var currentScreen = "title"
    
    var body: some View {
        ZStack{
            if currentScreen == "title" {
                TitleScreenView(usesTeamColors: $usesTeamColors, favoriteDriver: $favoriteDriver, currentScreen: $currentScreen)
            }
            if currentScreen == "mainHub" {
                MainHubView(usesTeamColors: $usesTeamColors, favoriteDriver: $favoriteDriver)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

