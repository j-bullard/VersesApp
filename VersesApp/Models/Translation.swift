//
//  Translation.swift
//  VersesApp
//
//  Created by Jason Bullard on 7/5/25.
//

import Foundation

public enum Translation: String, CaseIterable, Identifiable, Codable, Hashable {
    case akjv
    case asv
    case esv
    case gw
    case kjv
    case nasb
    case nasb1995
    case net
    case niv
    case nkjv
    case nlt
    case web
    case ylt
    
    public var id: String { self.rawValue }
    
    public var abbreviation: String {
        rawValue.uppercased()
    }
    
    public var fullName: String {
        switch self {
        case .akjv: return "American King James Version"
        case .asv: return "American Standard Version"
        case .esv: return "English Standard Version Revision 2016"
        case .gw: return "God's Word"
        case .kjv: return "King James Version"
        case .nasb: return "New American Standard Bible"
        case .nasb1995: return "New American Standard Bible (1995)"
        case .net: return "New English Translation"
        case .niv: return "New International Version"
        case .nkjv: return "New King James Version"
        case .nlt: return "New Living Translation"
        case .web: return "World English Bible"
        case .ylt: return "Young's Literal Translation"
        }
    }
}
