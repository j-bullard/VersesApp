//
//  BibleHelper.swift
//  VersesApp
//
//  Created by Jason Bullard on 7/6/25.
//

import Foundation

typealias BibleData = [String: [String: [String: String]]]

public class BibleHelper {
    static let shared = BibleHelper()
    
    private func loadBible(translation: Translation) -> BibleData? {
        let result = Bundle.main.decode(from: "\(translation.abbreviation)_bible") as Result<BibleData, Error>?
        
        switch result {
        case .success(let data):
            return data
        case .failure(let error):
            print(error.localizedDescription)
            return nil
        default:
            return nil
        }
    }
    
    func getVerseText(translation: Translation, selectedVerse: SelectedVerse) -> String? {
        guard let bible = loadBible(translation: translation),
              let chapters = bible[selectedVerse.book.name],
              let verses = chapters["\(selectedVerse.chapter)"] else {
            return nil
        }
        
        let range = selectedVerse.startVerse...selectedVerse.endVerse
        let selectedVerses = range.compactMap { verses["\($0)"] }
        return selectedVerses.joined(separator: " ")
    }
}
