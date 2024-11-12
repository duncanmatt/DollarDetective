//
//  Theme.swift
//  DollarDetective
//
//  Created by Matt Duncan on 11/11/24.
//

import Foundation
import SwiftUI

extension UserDefaults {
    var theme: Theme {
        get {
            return Theme(rawValue: string(forKey: "theme") ?? "light") ?? .device
        }
        set {
            set(newValue.rawValue, forKey: "theme")
        }
    }
}

enum Theme : String, CaseIterable, Identifiable   {
    var id : String { self.rawValue }
    
    case device
    case dark
    case light
    
    var img: String {
        switch self {
        case .device: return "iphone"
        case .light: return "sun.max"
        case .dark: return "moon.stars"
        }
    }

}

extension Theme {
    var userInterfaceStyle: UIUserInterfaceStyle {
        switch self {
        case .device:
            return .unspecified
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
    var colorScheme: ColorScheme? {
        switch self {
        case .device:
            return nil
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
}
