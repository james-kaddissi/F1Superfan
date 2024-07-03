//
//  MainHubView.swift
//  F1Superfan
//
//  Created by James Kaddissi on 7/3/24.
//

import Foundation
import SwiftUI

struct MainHubView: View {
    @Binding var usesTeamColors: Bool
    @Binding var favoriteDriver: String
    
    @State private var selectedTab = 1
    
    var body: some View {
        TabView(selection: $selectedTab){
            Text("Tab Content 1").tag(1)
            Text("Tab Content 2").tag(2)
            Text("Tab Content 3").tag(3)
            Text("Tab Content 4").tag(4)
            Text("Tab Content 5").tag(5)
        }
        .overlay(alignment: .bottom) {
            CustomTabView(selectedTab: $selectedTab, usesTeamColors: $usesTeamColors, favoriteDriver: $favoriteDriver)
        }
    }
}
