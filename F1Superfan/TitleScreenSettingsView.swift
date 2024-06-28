//
//  TitleScreenSettingsView.swift
//  F1Superfan
//
//  Created by James Kaddissi on 6/27/24.
//

import Foundation
import SwiftUI

struct TitleScreenSettingsView: View {
    @Binding var usesTeamColors: Bool
    @Binding var favoriteDriver: String

    var body: some View {
        VStack {
            Toggle("Use Team Colors", isOn: $usesTeamColors)
                .padding()
            Picker("Favorite Driver", selection: $favoriteDriver) {
                Text("Hamilton").tag("hamilton")
                Text("Russell").tag("russell")
                Text("Leclerc").tag("leclerc")
                Text("Sainz").tag("sainz")
                Text("Verstappen").tag("verstappen")
                Text("Perez").tag("perez")
                Text("Alonso").tag("alonso")
                Text("Stroll").tag("stroll")
                Text("Norris").tag("norris")
                Text("Piastri").tag("piastri")
                Text("Gasly").tag("gasly")
                Text("Ocon").tag("ocon")
                Text("Albon").tag("albon")
                Text("Sargeant").tag("sargeant")
                Text("Bottas").tag("bottas")
                Text("Zhou").tag("zhou")
                Text("Magnussen").tag("magnussen")
                Text("Hulkenberg").tag("hulkenberg")
                Text("Ricciardo").tag("ricciardo")
                Text("Tsunoda").tag("tsunoda")
            }
            .pickerStyle(MenuPickerStyle())
            .padding()
            Spacer()
        }
    }
}
