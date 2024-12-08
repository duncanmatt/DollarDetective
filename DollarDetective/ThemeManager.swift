//
//  AppViewModel.swift
//  DollarDetective
//
//  Created by Matt Duncan on 11/13/24.
//
import SwiftUI

class ThemeManager : ObservableObject {
    @Published var currTheme : Theme = UserDefaults.standard.theme
}
