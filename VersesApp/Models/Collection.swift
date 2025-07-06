//
//  Collection.swift
//  VersesApp
//
//  Created by Jason Bullard on 7/5/25.
//

import Foundation
import SwiftData

@Model
final class Collection {
    var name: String
    var icon: String
    var themeRawValue: String
    var createdAt: Date = Date()
    
    @Relationship(deleteRule: .cascade, inverse: \Verse.collections)
    var verses: [Verse] = []
    
    var theme: Theme {
        get { Theme(rawValue: themeRawValue)! }
        set { themeRawValue = newValue.rawValue }
    }
    
    // MARK: - Initialization
    init(name: String, icon: String, theme: Theme) {
        self.name = name
        self.icon = icon
        self.themeRawValue = theme.rawValue
    }
}

#if DEBUG
extension Collection {
    static var samples: [Collection] {
        [
            Collection(name: "Daily Devotions", icon: "sun.max.fill", theme: .midnight),
            Collection(name: "Prayer Requests", icon: "heart.fill", theme: .bubblegum),
            Collection(name: "Study Notes", icon: "book.fill", theme: .blood),
            Collection(name: "Favorite Verses", icon: "star.fill", theme: .tigers),
            Collection(name: "Memory Verses", icon: "brain.fill", theme: .lavender),
            Collection(name: "Worship Songs", icon: "music.quarternote.3", theme: .flame),
            Collection(name: "Sermons", icon: "graduationcap.fill", theme: .ocean),
            Collection(name: "Bible Study", icon: "books.vertical.fill", theme: .sky),
            Collection(name: "Testimonies", icon: "trophy.fill", theme: .sunflower),
            Collection(name: "Scripture Art", icon: "sparkles", theme: .blood)
        ]
    }
    
    static var sample: Collection {
        Collection(name: "Sample Collection", icon: "book.fill", theme: .midnight)
    }
}
#endif
