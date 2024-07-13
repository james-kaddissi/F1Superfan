//
//  driverWidget.swift
//  driverWidget
//
//  Created by James Kaddissi on 7/10/24.
//

import WidgetKit
import SwiftUI


struct Provider: AppIntentTimelineProvider {

    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), favoriteDriver: "", driverNumber: 0)
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), favoriteDriver: "sainz", driverNumber: 55)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        if let userDefaults = UserDefaults(suiteName: "group.com.F1Superfan") {
            let favoriteDriver = userDefaults.string(forKey: "favoriteDriver")!
            let driverNumber = userDefaults.integer(forKey: "driverNumber")
            
            entries.append(SimpleEntry(date: Date(), favoriteDriver: favoriteDriver, driverNumber: driverNumber))
        }

        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let favoriteDriver: String
    let driverNumber: Int
}

struct driverWidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var family
    
    var body: some View {
        switch family{
        case.systemSmall:
            ZStack {
                ContainerRelativeShape()
                    .fill(wteamColor(for: entry.favoriteDriver))
                Image(entry.favoriteDriver)
                    .resizable()
                    .frame(width: 155, height: 155)
                    .overlay(
                        LinearGradient(
                            gradient: Gradient(colors: [.clear, .clear, .clear,  wteamColor(for: entry.favoriteDriver), wteamColor(for: entry.favoriteDriver)]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .mask(
                        Image(entry.favoriteDriver)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    )
                    .opacity(0.8)
                    .blur(radius: 0.5)
                    
                
                Text(entry.date, style: .time)
                    .font(Font.custom("Formula1-Display-Wide", size: 12))
                    .foregroundColor(.white)
                    .scaleEffect(x: 1.0, y: 1.4)
                    .shadow(color: .black, radius: 1)
                    .padding(.top, 95)
                    .ignoresSafeArea()
                Text("#\(entry.driverNumber)")
                
                
                
                
            }
        case.systemMedium:
            ZStack {
                ContainerRelativeShape()
                    .fill(wteamColor(for: entry.favoriteDriver))
                Image(entry.favoriteDriver)
                    .resizable()
                    .frame(width: 155, height: 155)
                    .overlay(
                        LinearGradient(
                            gradient: Gradient(colors: [.clear, .clear, .clear,  wteamColor(for: entry.favoriteDriver), wteamColor(for: entry.favoriteDriver)]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .mask(
                        Image(entry.favoriteDriver)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    )
                    .opacity(0.8)
                    .blur(radius: 0.5)
                    .padding(.leading, 145)
                
                Text(entry.date, style: .time)
                    .font(Font.custom("Formula1-Display-Wide", size: 22))
                    .foregroundColor(.white)
                    .scaleEffect(x: 1.0, y: 1.4)
                    .shadow(color: .black, radius: 1)
                    .padding(.top, 80)
                    .padding(.trailing, 80)
                    .ignoresSafeArea()
                Text("#\(entry.driverNumber)")
                    .font(Font.custom("Formula1-Display-Wide", size: 50))
                    .foregroundColor(.gray)
                    .scaleEffect(x: 1.0, y: 1.4)
                    .padding(.bottom, 25)
                    .padding(.trailing, 60)
                
               
            }
        default:
            VStack {
                Text(entry.date, style: .time)
                Image(entry.favoriteDriver)
                    .resizable()
                    .frame(width: 50, height: 50)
            }
        }
        
    }
}

struct driverWidget: Widget {

    let kind: String = "driverWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            driverWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
                .padding(.all, -16)
        }
    }
}
