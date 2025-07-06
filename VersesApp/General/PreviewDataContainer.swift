//
//  PreviewDataContainer.swift
//  VersesApp
//
//  Created by Jason Bullard on 7/5/25.
//

import SwiftData
import SwiftUI

struct PreviewDataContainerViewModifier: ViewModifier {
    let container: ModelContainer
    
    init() {
        container = try! ModelContainer(for: Collection.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        // Add collections
        for collection in Collection.samples {
            container.mainContext.insert(collection)
            
            for (index, verse) in Verse.samples.enumerated() {
                verse.order = index
                collection.verses.append(verse)
                container.mainContext.insert(verse)
            }
        }
    }
    
    func body(content: Content) -> some View {
        content
            .modelContainer(container)
    }
}

extension View {
    func previewDataContainer() -> some View {
        modifier(PreviewDataContainerViewModifier())
    }
}
