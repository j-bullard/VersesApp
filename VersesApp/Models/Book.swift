//
//  Book.swift
//  VersesApp
//
//  Created by Jason Bullard on 7/5/25.
//

import Foundation

public struct Book: Identifiable, Codable, Hashable {
    public var id: Int
    public var name: String
    public var abbreviation: String
    public var chapters: [Int]
    public var testament: Testament
}
