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
    public func teamColor() -> Color {
        switch favoriteDriver {
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
    
    var body: some View {
        ZStack{
            ContainerRelativeShape().fill(LinearGradient(
                gradient: Gradient(colors: [.white, .white, usesTeamColors ? teamColor(): .red, usesTeamColors ? teamColor(): .red]),
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
                .background(RoundedRectangle(cornerRadius: 30).fill(usesTeamColors ? teamColor(): .red).opacity(0.3))
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
