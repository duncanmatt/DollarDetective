//
//  SegmentedThemePicker.swift
//  DollarDetective
//
//  Created by Matt Duncan on 11/12/24.
//
import SwiftUI

struct SegmentedThemePicker: View {
    @Binding var theme : Theme
    
    var body: some View {
        Picker("Theme of App", selection: $theme) {
            ForEach(Theme.allCases) { theme in
                Image(systemName: theme.img)
                    .tag(theme)
                    .scaledToFit()
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .onChange(of: theme) { _, newValue in
            UserDefaults.standard.theme = newValue
        }
    }
}
