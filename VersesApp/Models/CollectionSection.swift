//
//  VerseSection.swift
//  VersesApp
//
//  Created by Jason Bullard on 7/6/25.
//

import SwiftData
import Foundation

@Model
final class CollectionSection {
    var name: String
    var order: Int
    var collection: Collection
    
    @Relationship(deleteRule: .nullify, inverse: \Verse.section)
    var verses: [Verse] = []
    
    // MARK: - Initialization
    init(name: String, order: Int = 0, collection: Collection) {
        self.name = name
        self.order = order
        self.collection = collection
    }
}
