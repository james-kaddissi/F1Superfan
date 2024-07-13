//
//  driverWidgetBundle.swift
//  driverWidget
//
//  Created by James Kaddissi on 7/10/24.
//

import WidgetKit
import SwiftUI
import FirebaseCore

@main
struct driverWidgetBundle: WidgetBundle {
    var body: some Widget {
        driverWidget()
        driverWidgetLiveActivity()
    }
}
