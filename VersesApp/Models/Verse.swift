//
//  Verse.swift
//  VersesApp
//
//  Created by Jason Bullard on 7/5/25.
//

import Foundation
import SwiftData

@Model
final class Verse {
    var translation: Translation
    var bookId: Book.ID
    var chapter: Int
    var startVerse: Int
    var endVerse: Int
    var reference: String
    var createdDate: Date = Date()
    
    var collections: [Collection] = []
    
    @Relationship(deleteRule: .cascade, inverse: \VerseSegment.verse)
    var segments: [VerseSegment] = []
    
    var fullVerse: String {
        segments.compactMap { $0.text }.joined(separator: " ")
    }
    
    // MARK: - Initialization
    init(
        translation: Translation,
        book: Book,
        chapter: Int,
        startVerse: Int,
        endVerse: Int,
        reference: String
    ) {
        self.translation = translation
        self.bookId = book.id
        self.chapter = chapter
        self.startVerse = startVerse
        self.endVerse = endVerse
        self.reference = reference
    }
}

#if DEBUG
extension Verse {
    static var samples: [Verse] {
        [
            Verse(translation: .nasb, book: Book.Genesis, chapter: 1, startVerse: 1, endVerse: 1, reference: "Genesis 1:1"),
            Verse(translation: .nasb, book: Book.Mark, chapter: 1, startVerse: 15, endVerse: 15, reference: "Mark 1:15"),
            Verse(translation: .nasb, book: Book.Hebrews, chapter: 4, startVerse: 12, endVerse: 16, reference: "Hebrews 4:12-16")
        ]
    }
}
#endif
