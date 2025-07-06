//
//  Testament.swift
//  VersesApp
//
//  Created by Jason Bullard on 7/5/25.
//

import Foundation

public enum Testament: String, CaseIterable, Identifiable, Codable {
    case old
    case new
    
    public var id: Testament { self }
}
