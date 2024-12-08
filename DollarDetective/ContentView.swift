//
//  ContentView.swift
//  DollarDetective
//
//  Created by Matt Duncan on 10/14/24.
//

import SwiftUI

struct ContentView: View {
    @Binding var theme : Theme
    @State private var selection = 0
    
    init(theme: Binding<Theme>) {
        UITabBar.appearance().backgroundColor = .accent
        UITabBar.appearance().unselectedItemTintColor = .systemGray2
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(.mainText)]
        self._theme = theme
    }
        
    var body: some View {
        TabView(selection: $selection) {
            CPICalculatorView(theme: $theme)
                .tabItem {
                    Label("CPI Inflation", systemImage:"dollarsign")
                }
                .tag(0)
            FoodPricesView(theme: $theme)
                .tabItem {
                    Label("Food Prices", systemImage: "basket")
                }
                .tag(1)
                
        }
        .id(theme)
        .tint(.mainText)
        .preferredColorScheme(theme.colorScheme)
    }
    
}

#Preview {
    @Previewable @StateObject var themeManager = ThemeManager()
    
    ContentView(theme: $themeManager.currTheme)
}
