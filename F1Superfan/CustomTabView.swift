//
//  TabView.swift
//  F1Superfan
//
//  Created by James Kaddissi on 7/3/24.
//

import Foundation
import SwiftUI

struct CustomTabView: View {
    @Namespace private var animationNamespace
    @Binding var selectedTab: Int
    @Binding var usesTeamColors: Bool
    @Binding var favoriteDriver: String
    
    let tabIcons: [(image: String, name: String)] = [
        ("house", "Home"),
        ("magnifyingglass", "Search"),
        ("newspaper", "News"),
        ("person", "Profile"),
        ("gear", "Settings")
    ]
    
    var body: some View {
        ZStack {
            Capsule()
                .frame(height: 75)
                .foregroundColor(usesTeamColors ? teamColor(for: favoriteDriver): .red)
                .opacity(0.3)
                .shadow(radius: 2)
            
            HStack{
                ForEach(0..<tabIcons.count, id: \.self) { index in
                    Button {
                        withAnimation{
                            selectedTab = index + 1
                        }
                        print(index)
                        print(selectedTab)
                    } label: {
                        VStack (spacing: 8){
                            Spacer(minLength: 25)
                            
                            Image(systemName: tabIcons[index].image)
                                .resizable()
                                .frame(width: 25, height: 25)
                            Spacer()
                            
                            if index + 1 == selectedTab {
                                Capsule()
                                    .frame(height: 8)
                                    .foregroundColor(usesTeamColors ? teamColor(for: favoriteDriver): .red)
                                    .matchedGeometryEffect(id: "SelectedTabId", in: animationNamespace)
                                    .offset(y: -10)
                            } else {
                                Capsule()
                                    .frame(height: 2)
                                    .foregroundColor(.clear)
                                    .offset(y: -10)
                            }
                        }
                        .foregroundColor(index + 1 == selectedTab ? usesTeamColors ? teamColor(for: favoriteDriver): .red: .black)
                        
                    }
                }
            }
            .frame(height: 75)
            .clipShape(
                Capsule()
            )
        }
        .padding(.horizontal, 10)
    }
}
