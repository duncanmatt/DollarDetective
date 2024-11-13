//
//  ContentView.swift
//  DollarDetective
//
//  Created by Matt Duncan on 10/14/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    init() {
        UITabBar.appearance().backgroundColor = .accent
        UITabBar.appearance().unselectedItemTintColor = .systemGray2
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(.mainText)]
    }
        
    var body: some View {
        TabView {
            CPICalculatorView()
                .tabItem {
                    Label("CPI Inflation", systemImage:"dollarsign")
            }
            FoodPricesView()
                .tabItem {
                    Label("Food Prices", systemImage: "basket")
                }
                
        }
        .tint(.mainText)
        .preferredColorScheme(UserDefaults.standard.theme.colorScheme)
    }
    
}

#Preview {
    ContentView()
}
