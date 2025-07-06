//
//  LibraryView.swift
//  VersesApp
//
//  Created by Jason Bullard on 7/5/25.
//

import SwiftData
import SwiftUI

struct LibraryView: View {
    @Query(sort: \Collection.name) private var collections: [Collection]
    
    @State private var searchText: String = ""
    @State private var showAddCollectionSheet: Bool = false
    
    var filteredCollections: [Collection] {
        if searchText.isEmpty {
            return collections
        }
        
        return collections.filter { collection in
            collection.name.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredCollections) { collection in
                    NavigationLink(value: collection) {
                        CollectionRow(collection: collection)
                    }
                }
            }
            .environment(\.defaultMinListRowHeight, 50)
            .navigationTitle("Library")
            .searchable(text: $searchText, prompt: "Search collections")
            .accessibilityLabel("Collections list")
            .toolbar {
                toolbarContent
            }
            .sheet(isPresented: $showAddCollectionSheet) {
                CollectionFormView()
            }
            .overlay {
                overlayContent
            }
            .scrollDisabled(collections.isEmpty)
        }
    }
    
    @ViewBuilder
    private var overlayContent: some View {
        if filteredCollections.isEmpty {
            if searchText.isEmpty {
                ContentUnavailableView(
                    "No Collections Yet",
                    systemImage: "folder",
                    description: Text("Tap the plus button to start your first collection.")
                )
            } else {
                ContentUnavailableView(
                    "No Results Found",
                    systemImage: "magnifyingglass",
                    description: Text("Try adjusting your search or check your spelling.")
                )
            }
        }
    }
    
    @ToolbarContentBuilder
    private var toolbarContent: some ToolbarContent {
        ToolbarItem(placement: .primaryAction) {
            Button("Add Collection", systemImage: "folder.badge.plus") {
                showAddCollectionSheet.toggle()
            }
        }
    }
}

#Preview {
    LibraryView()
        .previewDataContainer()
}
