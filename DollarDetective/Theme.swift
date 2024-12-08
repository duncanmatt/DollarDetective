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
            return Theme(rawValue: string(forKey: "theme") ?? "light") ?? .dark
        }
        set {
            set(newValue.rawValue, forKey: "theme")
        }
    }
}

enum Theme : String, CaseIterable, Identifiable   {
    var id : String { self.rawValue }
    
    case dark
    case light
    
    var img: String {
        switch self {
            case .light: return "sun.max"
            case .dark: return "moon.stars"
        }
    }

}

extension Theme {
    var colorScheme: ColorScheme? {
        switch self {
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
}
