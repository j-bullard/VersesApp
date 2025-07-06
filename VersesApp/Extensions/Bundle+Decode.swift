//
//  Bundle+Decode.swift
//  VersesApp
//
//  Created by Jason Bullard on 7/6/25.
//

import Foundation

extension Bundle {
    public func decode<T: Codable>(from file: String) -> Result<T, Error> {
        guard let url = Bundle.main.url(forResource: file, withExtension: "json") else {
            return .failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "File not found"]))
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return .success(decodedData)
        } catch {
            return .failure(error)
        }
    }
}
