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
    @State private var editMode: EditMode = .inactive
    @State private var searchText: String = ""
    
    private var sortedVerses: [Verse] {
        collection.verses.sorted { lhs, rhs in
            if lhs.order == rhs.order {
                return lhs.createdDate < rhs.createdDate
            }
            return lhs.order < rhs.order
        }
    }
    
    var body: some View {
        List {
            ForEach(sortedVerses) { verse in
                if editMode != .active {
                    Text(verse.reference)
                        .swipeActions(edge: .trailing) {
                            Button("Remove", systemImage: "minus.circle.fill", role: .destructive) {
                                modelContext.delete(verse)
                                
                                try? modelContext.save()
                            }
                        }
                } else {
                    Text(verse.reference)
                }
            }
            .onMove(perform: move)
            .onDelete(perform: delete)
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search verses")
        .navigationTitle(collection.name)
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            toolbarContent
        }
        .sheet(isPresented: $showAddVerseSheet) {
            AddVerseView(collection: collection)
        }
        .overlay {
            if collection.verses.isEmpty {
                ContentUnavailableView(
                    "No Verses Yet",
                    systemImage: "book.closed",
                    description: Text("Start building your collection.")
                )
            }
        }
        .scrollDisabled(collection.verses.isEmpty)
        .environment(\.editMode, $editMode.animation())
    }
    
    @ToolbarContentBuilder
    private var toolbarContent: some ToolbarContent {
        ToolbarItemGroup(placement: .topBarTrailing) {
            if !sortedVerses.isEmpty {
                EditButton()
            }
            
            if editMode != .active {
                Button("Add Verse", systemImage: "plus.circle.fill") {
                    showAddVerseSheet.toggle()
                }
            }
        }
    }
    
    private func delete(at offsets: IndexSet) {
        for offset in offsets {
            let verse = sortedVerses[offset]
            modelContext.delete(verse)
        }
        
        try? modelContext.save()
    }
    
    private func move(from source: IndexSet, to destination: Int) {
        let verses = sortedVerses
        
        for (index, verse) in verses.enumerated() {
            verse.order = index
        }
        
        var reorderedVerses = verses
        reorderedVerses.move(fromOffsets: source, toOffset: destination)
        
        for (index, verse) in reorderedVerses.enumerated() {
            verse.order = index
        }
        
        try? modelContext.save()
    }
}

#Preview {
    NavigationStack {
        CollectionDetailView(collection: Collection.samples[0])
    }
    .previewDataContainer()
}
