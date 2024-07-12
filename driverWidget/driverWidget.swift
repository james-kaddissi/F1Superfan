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
        SimpleEntry(date: Date(), favoriteDriver: "sainz")
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), favoriteDriver: "sainz")
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, favoriteDriver: "sainz")
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let favoriteDriver: String
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



#Preview(as: .systemSmall) {
    driverWidget()
} timeline: {
    SimpleEntry(date: .now, favoriteDriver: "sainz")
    SimpleEntry(date: .now, favoriteDriver: "hamilton")
    SimpleEntry(date: .now, favoriteDriver: "perez")
    SimpleEntry(date: .now, favoriteDriver: "verstappen")
}
