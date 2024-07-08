//
//  DriverTabView.swift
//  F1Superfan
//
//  Created by James Kaddissi on 7/6/24.
//

import Foundation
import SwiftUI


struct DriverTabView: View {
    @Binding var usesTeamColors: Bool
    @Binding var favoriteDriver: String
    
    
    var body: some View {
        ZStack{
            ContainerRelativeShape().fill(usesTeamColors ? teamColor(for: favoriteDriver):.red).ignoresSafeArea()
            VStack {
                HStack{
                    Image(favoriteDriver)
                        .resizable()
                        .frame(width: 125, height: 125)
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(Color.black, lineWidth: 6)
                        )
                        .padding(.leading, 75)
                    
                    Spacer()
                    VStack{
                        Text(firstName(for:favoriteDriver))
                            .font(Font.custom("Formula1-Display-Wide", size: 22))
                            .scaleEffect(x: 1.0, y: 1.4)
                            .foregroundColor(.white)
                            .padding(.trailing, 75)
                        
                        Text(lastName(for:favoriteDriver))
                            .font(Font.custom("Formula1-Display-Wide", size: 22))
                            .scaleEffect(x: 1.0, y: 1.4)
                            .foregroundColor(.white)
                            .padding(.trailing, 75)
                    }
                    
                }
               
                
                DriverStatsView(usesTeamColors: $usesTeamColors, favoriteDriver: $favoriteDriver).padding(.top, 20)
                
                
                Spacer()
            }
        }
    }
}

struct DriverStatsView: View {
    @Binding var usesTeamColors: Bool
    @Binding var favoriteDriver: String
    
    @StateObject private var driverStatsManager = DriverStatsManager()
    
    var body: some View {
        VStack {
            if let stats = driverStatsManager.driverStats {
                HStack {
                    Spacer()
                    VStack {
                        Text("\(stats.wins)")
                            .font(Font.custom("Formula1-Display-Wide", size: 20))
                            .scaleEffect(x: 1.0, y: 2)
                            .foregroundColor(.white)
                            .padding(.top, 30)
                        Text("Wins")
                            .font(Font.custom("Formula1-Display-Wide", size: 8))
                            .scaleEffect(x: 1.0, y: 2)
                            .foregroundColor(.white)
                            .padding(.top, 30)
                    }
                    Spacer()
                    VStack {
                        Text("\(stats.wdcs)")
                            .font(Font.custom("Formula1-Display-Wide", size: 20))
                            .scaleEffect(x: 1.0, y: 2)
                            .foregroundColor(.white)
                            .padding(.top, 30)
                            .padding(.leading, 25)
                        Text("WDCS")
                            .font(Font.custom("Formula1-Display-Wide", size: 8))
                            .scaleEffect(x: 1.0, y: 2)
                            .foregroundColor(.white)
                            .padding(.top, 30)
                            .padding(.leading, 25)
                    }
                    Spacer()
                    VStack {
                        Text("\(stats.podiums)")
                            .font(Font.custom("Formula1-Display-Wide", size: 20))
                            .scaleEffect(x: 1.0, y: 2)
                            .foregroundColor(.white)
                            .padding(.top, 30)
                            .padding(.leading, 15)
                        Text("Podiums")
                            .font(Font.custom("Formula1-Display-Wide", size: 8))
                            .scaleEffect(x: 1.0, y: 2)
                            .foregroundColor(.white)
                            .padding(.top, 30)
                            .padding(.leading, 15)
                    }
                    Spacer()
                }
                HStack {
                    ZStack {
                        VStack {
                            Text("#\(stats.number)")
                                .font(Font.custom("Formula1-Display-Wide", size: 30))
                                .foregroundColor(Color(hex: "#FF5733"))
                                .scaleEffect(x: 1.0, y: 1.7)
                                .padding(.top, -60)
                                .padding(.trailing, 150)
                                .shadow(color: Color.white.opacity(0.8), radius: 2, x: 1, y: 1)
                            Text("\(stats.heightString)")
                                .font(Font.custom("Formula1-Display-Regular", size: 30))
                                .foregroundColor(.white)
                                .padding(.top, 10)
                                .padding(.trailing, 120)
                                .shadow(color: Color.gray.opacity(0.5), radius: 2, x: 1, y: 1)
                            Text("\(stats.weight) lbs.")
                                .font(Font.custom("Formula1-Display-Regular", size: 30))
                                .foregroundColor(.white)
                                .padding(.top, 40)
                                .padding(.trailing, 140)
                                .shadow(color: Color.gray.opacity(0.5), radius: 2, x: 1, y: 1)
                        }
                        .overlay(
                            GeometryReader { geometry in
                                Color.black.frame(width: 2, height: geometry.size.height*2+60)
                                    .offset(x: geometry.size.width / 2 + 10, y: -80)
                            }
                            .ignoresSafeArea(edges: .vertical), alignment: .trailing
                        )
                        Image("standing\(favoriteDriver)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350, height: 350)
                            .padding(.top, 30)
                            .padding(.leading, 150)
                    }
                }
            } else {
                Text("Loading...")
                    .onAppear {
                        driverStatsManager.fetchDriverStats(for: favoriteDriver)
                    }
            }
        }
        .onChange(of: favoriteDriver) { newDriver in
            driverStatsManager.fetchDriverStats(for: newDriver)
        }
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

