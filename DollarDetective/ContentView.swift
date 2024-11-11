//
//  ContentView.swift
//  DollarDetective
//
//  Created by Matt Duncan on 10/14/24.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = .accent
        UITabBar.appearance().unselectedItemTintColor = .systemGray
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
        
    var body: some View {
        TabView {
            CPICalculatorView()
                .tabItem {
                    Label("CPI Inflation", systemImage:"dollarsign")
                        .preferredColorScheme(.dark)
            }
            FoodPricesView()
                .tabItem {
                    Label("Food Prices", systemImage: "basket")
                }
                .preferredColorScheme(.dark)
                
        }
        .preferredColorScheme(.dark)
        .tint(.white)
    }
}

#Preview {
    ContentView()
}
