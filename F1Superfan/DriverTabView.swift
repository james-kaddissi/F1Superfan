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
                HStack{
                    Text("Wins:")
                }
                Spacer()
            }
        }
    }
}
