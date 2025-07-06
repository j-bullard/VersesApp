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
    @Query private var verses: [Verse]
    
    @State private var searchText: String = ""
    @FocusState private var searchFocused: Bool
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
                if !searchFocused {
                    NavigationLink(destination: AllVersesView()) {
                        HStack(alignment: .center, spacing: 12) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 6)
                                    .foregroundStyle(.indigo)
                                    .frame(width: 30, height: 30)
                                
                                Image(systemName: "tray.fill")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 14, weight: .semibold))
                                    .imageScale(.medium)
                            }
                            
                            Text("All Verses")
                            Spacer()
                            Text("\(verses.count)")
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                
                ForEach(filteredCollections) { collection in
                    NavigationLink(destination: CollectionDetailView(collection: collection)) {
                        CollectionRow(collection: collection)
                    }
                }
            }
            .navigationTitle("Library")
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search collections")
            .searchFocused($searchFocused)
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
