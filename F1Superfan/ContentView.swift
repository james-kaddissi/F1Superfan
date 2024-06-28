//
//  ContentView.swift
//  F1Superfan
//
//  Created by James Kaddissi on 6/27/24.
//

import SwiftUI

struct ContentView: View {
    @State private var usesTeamColors = true
    @State private var favoriteDriver = "sainz"
    @State private var showSettings = false
    
    var body: some View {
        TitleScreenView(usesTeamColors: $usesTeamColors, favoriteDriver: $favoriteDriver, showSettings: $showSettings)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
