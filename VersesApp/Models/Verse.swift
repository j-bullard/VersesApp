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
    var content: [String]
    var reference: String
    var createdDate: Date = Date()
    
    var collections: [Collection] = []
    
    var fullVerse: String {
        content.joined(separator: " ")
    }
    
    // MARK: - Initialization
    init(
        translation: Translation,
        book: Book,
        chapter: Int,
        startVerse: Int,
        endVerse: Int,
        content: [String],
        reference: String
    ) {
        self.translation = translation
        self.bookId = book.id
        self.chapter = chapter
        self.startVerse = startVerse
        self.endVerse = endVerse
        self.content = content
        self.reference = reference
    }
}

#if DEBUG
extension Verse {
    static var samples: [Verse] {
        [
            Verse(translation: .nasb, book: Book.Genesis, chapter: 1, startVerse: 1, endVerse: 1, content: ["In the beginning God created the heavens and the earth."], reference: "Genesis 1:1"),
            
            Verse(translation: .nasb, book: Book.Mark, chapter: 1, startVerse: 15, endVerse: 15, content: ["and saying, “The time is fulfilled, and the kingdom of God has come near; repent and believe in the gospel.”"], reference: "Mark 1:15")
        ]
    }
}
#endif
