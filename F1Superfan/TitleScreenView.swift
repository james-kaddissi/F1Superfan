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
    @Binding var currentScreen: String
    
    @State private var showSettings = false
    
    var body: some View {
        NavigationView {
            ZStack {
                ContainerRelativeShape().fill(LinearGradient(
                    gradient: Gradient(colors: [.white, usesTeamColors ? teamColor(for: favoriteDriver): .red, usesTeamColors ? teamColor(for: favoriteDriver): .red, usesTeamColors ? teamColor(for: favoriteDriver): .red]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )).ignoresSafeArea()
                Image(favoriteDriver)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay(
                        LinearGradient(
                            gradient: Gradient(colors: [.clear, .clear, .clear,  usesTeamColors ? teamColor(for: favoriteDriver): .red,  usesTeamColors ? teamColor(for: favoriteDriver): .red]),
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
                        currentScreen = "mainHub"
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
}
