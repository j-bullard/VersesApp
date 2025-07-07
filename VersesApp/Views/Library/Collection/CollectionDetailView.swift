//
//  CollectionDetailView.swift
//  VersesApp
//
//  Created by Jason Bullard on 7/5/25.
//

import SwiftData
import SwiftUI

struct CollectionDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    let collection: Collection
    
    @State private var showAddVerseSheet: Bool = false
    @State private var editMode: EditMode = .inactive
    @State private var searchText: String = ""
    @State private var showCollectionFormSheet: Bool = false
    @State private var showDeleteCollectionAlert: Bool = false
    
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
                            Button("Remove", role: .destructive) {
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
        .sheet(isPresented: $showCollectionFormSheet) {
            CollectionFormView(collection: collection)
        }
        .alert("Delete \"\(collection.name)\"", isPresented: $showDeleteCollectionAlert) {
            Button("Cancel", role: .cancel) {}
            Button("Delete", role: .destructive) {
                self.modelContext.delete(collection)
                try? self.modelContext.save()
                dismiss()
            }
        } message: {
            Text("This will delete all verses in this collection.")
        }
    }
    
    @ToolbarContentBuilder
    private var toolbarContent: some ToolbarContent {
        ToolbarItem(placement: .primaryAction) {
            if editMode == .inactive {
                Menu("Menu", systemImage: "ellipsis.circle") {
                    Button("Show Collection Info", systemImage: "info.circle") {
                        showCollectionFormSheet.toggle()
                    }
                    
                    Button("Select Verses", systemImage: "checkmark.circle") {
                        editMode = .active
                    }
                    .disabled(collection.verses.isEmpty)
                    
                    Button("Add Verse", systemImage: "text.badge.plus") {
                        showAddVerseSheet.toggle()
                    }
                    
                    Button("Delete Collection", systemImage: "trash", role: .destructive) {
                        showDeleteCollectionAlert.toggle()
                    }
                }
            } else {
                Button("Done") {
                    editMode = .inactive
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
