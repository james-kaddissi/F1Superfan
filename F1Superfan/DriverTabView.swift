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
    @State private var driverStats: DriverStats?
    
    private func fetchDriverStats(for driverName: String) {
            FirebaseService.shared.fetchDriverStats(for: driverName) { stats in
                DispatchQueue.main.async {
                    self.driverStats = stats
                }
            }
        }
    
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
                        .padding(.leading, 25)
                    
                    Spacer()
                    VStack{
                        Text(firstName(for:favoriteDriver))
                            .font(Font.custom("Formula1-Display-Wide", size: 22))
                            .scaleEffect(x: 1.0, y: 1.4)
                            .foregroundColor(.white)
                            .padding(.trailing, 25)
                        
                        Text(lastName(for:favoriteDriver))
                            .font(Font.custom("Formula1-Display-Wide", size: 22))
                            .scaleEffect(x: 1.0, y: 1.4)
                            .foregroundColor(.white)
                            .padding(.trailing, 25)
                    }
                    
                }
               
                if let driverStats = driverStats {
                    DriverStatsView(driverStats: driverStats).padding(.top, 20)
                } else {
                    Text("Loading...")
                        .onAppear {
                            fetchDriverStats(for: favoriteDriver)
                        }
                }
                
                Spacer()
            }
        }
    }
}

struct DriverStatsView: View {
    let driverStats: DriverStats

    var body: some View {
        HStack {
            Spacer()
            VStack {
                Text("\(driverStats.wins)")
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
                Text("\(driverStats.wdcs)")
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
                Text("\(driverStats.podiums)")
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
    }
}
