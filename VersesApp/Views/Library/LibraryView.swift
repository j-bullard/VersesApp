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
    
    @State private var showAddCollectionSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(collections) { collection in
                    NavigationLink(value: collection) {
                        CollectionRow(collection: collection)
                    }
                }
            }
            .environment(\.defaultMinListRowHeight, 50)
            .navigationTitle("Library")
            .toolbar {
                toolbarContent
            }
            .sheet(isPresented: $showAddCollectionSheet) {
                CollectionFormView()
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
