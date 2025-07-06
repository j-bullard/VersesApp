//
//  VerseSegment.swift
//  VersesApp
//
//  Created by Jason Bullard on 7/6/25.
//

import SwiftData
import SwiftUI

@Model
final class VerseSegment {
    var text: String
    var verseNumber: Int
    var order: Int
    var themeRawValue: String
    
    @Relationship
    var verse: Verse?
    
    var theme: Theme {
        get { Theme(rawValue: themeRawValue)! }
        set { themeRawValue = newValue.rawValue }
    }
    
    // MARK: - Initializers
    init(text: String, verseNumber: Int, order: Int) {
        self.text = text
        self.verseNumber = verseNumber
        self.themeRawValue = Theme.midnight.rawValue
        self.order = order
    }
}
