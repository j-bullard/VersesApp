//
//  AllVersesView.swift
//  VersesApp
//
//  Created by Jason Bullard on 7/6/25.
//

import SwiftData
import SwiftUI

struct AllVersesView: View {
    @State private var searchText: String = ""
    
    @Query private var verses: [Verse]
    
    /// Only get unique verses based on reference. Two collections can contain the same verse reference. This will prevent a verse (e.g., Genesis 1:1) added to two different collections from showing twice.
    var uniqueFilteredVerses: [Verse] {
        let uniqueVerses = verses.unique { $0.reference }
        
        if !searchText.isEmpty {
            return uniqueVerses.filter {
                $0.reference.localizedCaseInsensitiveContains(searchText) ||
                $0.text.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        return uniqueVerses
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(uniqueFilteredVerses) { verse in
                    VerseRow(verse: verse)
                }
            }
            .navigationTitle("All Verses")
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search verses")
            .overlay {
                overlayContent
            }
            .scrollDisabled(uniqueFilteredVerses.isEmpty)
        }
    }
    
    @ViewBuilder
    private var overlayContent: some View {
        if uniqueFilteredVerses.isEmpty {
            if searchText.isEmpty {
                ContentUnavailableView(
                    "No Verses Yet",
                    systemImage: "book.closed",
                    description: Text("Start building your collection.")
                )
            } else {
                ContentUnavailableView(
                    "No Results Found",
                    systemImage: "text.page.badge.magnifyingglass",
                    description: Text("Try adjusting your search or check your spelling.")
                )
            }
        }
    }
}

#Preview {
    AllVersesView()
        .previewDataContainer()
}
