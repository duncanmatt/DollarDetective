//
//  DollarDetectiveApp.swift
//  DollarDetective
//
//  Created by Matt Duncan on 10/14/24.
//

import SwiftUI

@main
struct DollarDetectiveApp: App {
    @StateObject var themeManager = ThemeManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView(theme: $themeManager.currTheme)
        }
    }
}
