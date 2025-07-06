//
//  CollectionDetailView.swift
//  VersesApp
//
//  Created by Jason Bullard on 7/5/25.
//

import SwiftData
import SwiftUI

struct CollectionDetailView: View {
    @Environment(\.modelContext) private var modelContext
    
    let collection: Collection
    
    @State private var showAddVerseSheet: Bool = false
    
    var body: some View {
        List {
            ForEach(collection.verses) { verse in
                Text(verse.reference)
                    .swipeActions(edge: .trailing) {
                        Button("Remove", systemImage: "minus.circle.fill", role: .destructive) {
                            modelContext.delete(verse)
                            
                            try? modelContext.save()
                        }
                    }
            }
        }
        .navigationTitle(collection.name)
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            toolbarContent
        }
        .sheet(isPresented: $showAddVerseSheet) {
            AddVerseView(collection: collection)
        }
    }
    
    @ToolbarContentBuilder
    private var toolbarContent: some ToolbarContent {
        ToolbarItem(placement: .primaryAction) {
            Button("Add Verse", systemImage: "text.badge.plus") {
                showAddVerseSheet.toggle()
            }
        }
    }
}

#Preview {
    NavigationStack {
        CollectionDetailView(collection: Collection.samples[0])
    }
    .previewDataContainer()
}
