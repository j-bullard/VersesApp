//
//  SelectedVerse.swift
//  VersesApp
//
//  Created by Jason Bullard on 7/6/25.
//

import Foundation

struct SelectedVerse: Hashable {
    var book: Book
    var chapter: Int
    var startVerse: Int
    var endVerse: Int
    
    var reference: String {
        var reference = "\(book.name) \(chapter):\(startVerse)"
        if startVerse != endVerse {
            reference += "-\(endVerse)"
        }
        return reference
    }
    
    static let initial: Self = .init(book: .Genesis, chapter: 1, startVerse: 1, endVerse: 1)
}
