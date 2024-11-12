//
//  ContentView_Previews.swift
//  DollarDetective
//
//  Created by Matt Duncan on 11/11/24.
//
import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            
            ContentView()
                .environment(\.colorScheme, .dark)
        }
    }
}
