//
//  CollectionDetailView.swift
//  VersesApp
//
//  Created by Jason Bullard on 7/5/25.
//

import SwiftData
import SwiftUI

struct CollectionDetailView: View {
    let collection: Collection
    
    @State private var showAddVerseSheet: Bool = false
    
    var body: some View {
        List {
            // TODO: Loop through verses
        }
        .navigationTitle(collection.name)
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            toolbarContent
        }
        .sheet(isPresented: $showAddVerseSheet) {
            EmptyView()
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
}
