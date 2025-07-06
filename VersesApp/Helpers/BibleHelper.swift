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
            print("Failed to load Bible: \(error.localizedDescription)")
            return nil
        case .none:
            print("Bible file not found")
            return nil
        }
    }
    
    func getVerses(translation: Translation, bookName: String, chapter: Int, verseRange: ClosedRange<Int>) -> [String] {
        guard let bible = loadBible(translation: translation),
              let chapters = bible[bookName],
              let verses = chapters["\(chapter)"] else {
            return []
        }
        
        return verseRange.compactMap { verses["\($0)"] }
    }
}
