//
//  TitleScreenView.swift
//  F1Superfan
//
//  Created by James Kaddissi on 6/27/24.
//

import Foundation
import SwiftUI

struct TitleScreenView: View {
    @Binding var usesTeamColors: Bool
    @Binding var favoriteDriver: String
    @Binding var showSettings: Bool
    
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
        ZStack {
            ContainerRelativeShape().fill(LinearGradient(
                gradient: Gradient(colors: [.white, usesTeamColors ? teamColor(): .red, usesTeamColors ? teamColor(): .red, usesTeamColors ? teamColor(): .red]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )).ignoresSafeArea()
            Image(favoriteDriver)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [.clear, .clear, .clear,  usesTeamColors ? teamColor(): .red,  usesTeamColors ? teamColor(): .red]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .mask(
                    Image(favoriteDriver)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                )
                .opacity(0.7)
                .blur(radius: 0.8)
            VStack {
                HStack{
                    Text("F")
                        .padding(.top, 16)
                        .font(Font.custom("Formula1-Display-Wide", size: 22))
                        .scaleEffect(x: 1.0, y: 1.4)
                        .foregroundColor(.black)
                    Text("1")
                        .padding(.top, 16)
                        .padding(.leading, -4)
                        .font(Font.custom("Formula1-Display-Wide", size: 22))
                        .scaleEffect(x: 1.0, y: 1.4)
                        .foregroundColor(.red)
                    Text("Superfan")
                        .padding(.top, 16)
                        .font(Font.custom("Formula1-Display-Wide", size: 22))
                        .scaleEffect(x: 1.0, y: 1.4)
                        .foregroundColor(.white)
                    
                }
                Spacer()
                Button{
                    print("tapped")
                }label: {
                    Text("Enter")
                        .font(Font.custom("Formula1-Display-Regular", size: 32))
                        .foregroundColor(.black)
                        .frame(width: 200, height: 80)
                        .background(Color.white)
                        .cornerRadius(20)
                        .overlay(Color.red.opacity(0.1).cornerRadius(20))
                }
                Image("image")
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, -35)
                    .padding(.bottom, -50)
                    .foregroundColor(.white)
                    .rotationEffect(.degrees(-5))
                HStack {
                    Text("").padding(.trailing, 285)
                    Button(action: {
                        showSettings.toggle()
                    }, label: {
                        Image(systemName: "gear")
                            .foregroundColor(.white)
                            .scaleEffect(x: 2.0, y: 2.0)
                    })
                }
            }
        }
        .sheet(isPresented: $showSettings, content: {
            TitleScreenSettingsView(usesTeamColors: $usesTeamColors, favoriteDriver: $favoriteDriver)
        })
    }
}
