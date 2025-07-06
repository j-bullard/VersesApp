//
//  Sequence+Unique.swift
//  VersesApp
//
//  Created by Jason Bullard on 7/6/25.
//

/// https://www.avanderlee.com/swift/unique-values-removing-duplicates-array/#removing-duplicate-elements-by-any-hashable-value
extension Sequence {
    func unique<T: Hashable>(by keyForValue: (Iterator.Element) throws -> T) rethrows -> [Iterator.Element] {
        var seen: Set<T> = []
        return try filter { try seen.insert(keyForValue($0)).inserted }
    }
}
