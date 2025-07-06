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
            
            for verse in Verse.samples {
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

/*
 @MainActor
 class DataController {
     static let previewContainer: ModelContainer = {
         do {
             let config = ModelConfiguration(isStoredInMemoryOnly: true)
             let container = try ModelContainer(for: User.self, configurations: config)

             for i in 1...9 {
                 let user = User(name: "Example User \(i)")
                 container.mainContext.insert(user)
             }

             return container
         } catch {
             fatalError("Failed to create model container for previewing: \(error.localizedDescription)")
         }
     }()
 }
 */
