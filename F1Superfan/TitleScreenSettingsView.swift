//
//  TitleScreenSettingsView.swift
//  F1Superfan
//
//  Created by James Kaddissi on 6/27/24.
//

import SwiftUI

struct TitleScreenSettingsView: View {
    @Binding var usesTeamColors: Bool
    @Binding var favoriteDriver: String
    
    
    var body: some View {
        ZStack{
            ContainerRelativeShape().fill(LinearGradient(
                gradient: Gradient(colors: [.white, .white, usesTeamColors ? teamColor(for: favoriteDriver): .red, usesTeamColors ? teamColor(for : favoriteDriver): .red]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )).ignoresSafeArea()
            VStack {
                Toggle("Use Team Colors", isOn: $usesTeamColors)
                    .toggleStyle(SwitchToggleStyle(tint: .red))
                    .frame(maxWidth: 200, alignment: .center)
                    .font(Font.custom("Formula1-Display-Bold", size: 16))
                    .padding(.top, 50)
                    .padding(.bottom, 50)
                    
                Text("Favorite Driver")
                    .font(Font.custom("Formula1-Display-Wide", size: 14))
                
                Picker(selection: $favoriteDriver, label: Text("Favorite Driver").foregroundColor(.black).font(Font.custom("Formula1-Display-Regular", size: 18))) {
                    ForEach(drivers, id: \.self) { driver in
                        Text(driver.displayName)
                            .tag(driver.id)
                            .foregroundColor(.black)
                            .font(Font.custom("Formula1-Display-Regular", size: 18))
                    }
                }
                .pickerStyle(.wheel)
                .background(RoundedRectangle(cornerRadius: 30).fill(usesTeamColors ? teamColor(for: favoriteDriver): .red).opacity(0.3))
                .padding()
                
                Spacer()
            }
            
        }
        
    }
    
    struct TitleScreenSettingsView_Previews: PreviewProvider {
        static var previews: some View {
            TitleScreenSettingsView(usesTeamColors: .constant(true), favoriteDriver: .constant("hamilton"))
                .previewDevice("iPhone 12 Pro")
        }
    }
    
    struct Driver: Hashable {
        var id: String
        var displayName: String
    }
    
    let drivers = [
        Driver(id: "hamilton", displayName: "Hamilton"),
        Driver(id: "russell", displayName: "Russell"),
        Driver(id: "leclerc", displayName: "Leclerc"),
        Driver(id: "sainz", displayName: "Sainz"),
        Driver(id: "verstappen", displayName: "Verstappen"),
        Driver(id: "perez", displayName: "Perez"),
        Driver(id: "alonso", displayName: "Alonso"),
        Driver(id: "stroll", displayName: "Stroll"),
        Driver(id: "norris", displayName: "Norris"),
        Driver(id: "piastri", displayName: "Piastri"),
        Driver(id: "gasly", displayName: "Gasly"),
        Driver(id: "ocon", displayName: "Ocon"),
        Driver(id: "albon", displayName: "Albon"),
        Driver(id: "sargeant", displayName: "Sargeant"),
        Driver(id: "bottas", displayName: "Bottas"),
        Driver(id: "zhou", displayName: "Zhou"),
        Driver(id: "magnussen", displayName: "Magnussen"),
        Driver(id: "hulkenberg", displayName: "Hulkenberg"),
        Driver(id: "ricciardo", displayName: "Ricciardo"),
        Driver(id: "tsunoda", displayName: "Tsunoda")
    ]
}
