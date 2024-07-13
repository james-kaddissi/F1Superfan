//
//  ContentView.swift
//  F1Superfan
//
//  Created by James Kaddissi on 6/27/24.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    @State private var usesTeamColors = true
    @State private var favoriteDriver = "sainz"
    @StateObject private var driverStatsManager = DriverStatsManager()
    @State private var currentScreen = "title"
    
    var body: some View {
        ZStack{
            if let stats = driverStatsManager.driverStats {
                ZStack{
                    if currentScreen == "title" {
                        TitleScreenView(usesTeamColors: $usesTeamColors, favoriteDriver: $favoriteDriver, currentScreen: $currentScreen)
                    }
                    if currentScreen == "mainHub" {
                        MainHubView(usesTeamColors: $usesTeamColors, favoriteDriver: $favoriteDriver)
                    }
                }
                .onAppear {
                    if let userDefaults = UserDefaults(suiteName: "group.com.F1Superfan") {
                        userDefaults.set(favoriteDriver, forKey: "favoriteDriver")
                        userDefaults.set(stats.number, forKey: "driverNumber")
                    }
                }.onChange(of: favoriteDriver) { newDriver in
                    driverStatsManager.fetchDriverStats(for: newDriver)
                    if let userDefaults = UserDefaults(suiteName: "group.com.F1Superfan") {
                        userDefaults.set(favoriteDriver, forKey: "favoriteDriver")
                        userDefaults.set(stats.number, forKey: "driverNumber")
                    }
                    WidgetCenter.shared.reloadAllTimelines()
                }
            } else {
                ZStack {
                    TitleScreenSettingsView(usesTeamColors: $usesTeamColors, favoriteDriver: $favoriteDriver)
                }
                .onAppear {
                    driverStatsManager.fetchDriverStats(for: favoriteDriver)
                }
            }
        }
        
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class DriverStatsManager: ObservableObject {
    @Published var driverStats: DriverStats?
    
    func fetchDriverStats(for driverName: String) {
        FirebaseService.shared.fetchDriverStats(for: driverName) { stats in
            DispatchQueue.main.async {
                self.driverStats = stats
            }
        }
    }
}
