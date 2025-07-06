//
//  Translation.swift
//  VersesApp
//
//  Created by Jason Bullard on 7/5/25.
//

import Foundation

public enum Translation: String, CaseIterable, Identifiable, Codable, Hashable {
    case nasb
    case nasb1995
    case esv
    case niv
    case kjv
    
    public var id: String { self.rawValue }
    
    public var abbreviation: String {
        rawValue.uppercased()
    }
    
    public var fullName: String {
        switch self {
        case .nasb: return "New American Standard Bible"
        case .nasb1995: return "New American Standard Bible (1995)"
        case .esv: return "English Standard Version"
        case .niv: return "New International Version"
        case .kjv: return "King James Version"
        }
    }
}
