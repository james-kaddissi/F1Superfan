//
//  driverWidgetLiveActivity.swift
//  driverWidget
//
//  Created by James Kaddissi on 7/10/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct driverWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct driverWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: driverWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension driverWidgetAttributes {
    fileprivate static var preview: driverWidgetAttributes {
        driverWidgetAttributes(name: "World")
    }
}

extension driverWidgetAttributes.ContentState {
    fileprivate static var smiley: driverWidgetAttributes.ContentState {
        driverWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: driverWidgetAttributes.ContentState {
         driverWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: driverWidgetAttributes.preview) {
   driverWidgetLiveActivity()
} contentStates: {
    driverWidgetAttributes.ContentState.smiley
    driverWidgetAttributes.ContentState.starEyes
}
