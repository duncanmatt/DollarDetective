//
//  SegmentedThemePicker.swift
//  DollarDetective
//
//  Created by Matt Duncan on 11/12/24.
//
import SwiftUI

struct SegmentedThemePicker: View {
    @AppStorage("selectedTheme") private var selectedTheme: Theme = .device
    
    var body: some View {
        Picker("Theme of App", selection: $selectedTheme) {
            ForEach(Theme.allCases) { theme in
                Image(systemName: theme.img)
                    .tag(theme)
                    .scaledToFit()
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .onChange(of: selectedTheme) { _, newValue in
            changeTheme(to:newValue)
        }
    }
    
    func changeTheme(to theme: Theme) {
        UserDefaults.standard.theme = theme
        
        let keyWindow = UIApplication
            .shared
            .connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.keyWindow }
            .last
        
        keyWindow?.rootViewController?.overrideUserInterfaceStyle = theme.userInterfaceStyle
        
    }
}
