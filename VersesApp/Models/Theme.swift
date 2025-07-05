//
//  Theme.swift
//  VersesApp
//
//  Created by Jason Bullard on 7/5/25.
//

import SwiftUI

public enum Theme: String, CaseIterable, Codable, Identifiable {
    case blood
    case bubblegum
    case flame
    case tigers
    case midnight
    case lavender
    case lime
    case ocean
    case sky
    case sunflower
    
    public var accentColor: Color {
        switch self {
        default:
            return .white
        }
    }
    
    public var mainColor: Color {
        Color(rawValue, bundle: .main)
    }
    
    public var name: String {
        rawValue.capitalized
    }
    
    public var id: String {
        name
    }
}
