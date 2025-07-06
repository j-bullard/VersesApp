//
//  VerseRow.swift
//  VersesApp
//
//  Created by Jason Bullard on 7/6/25.
//

import SwiftData
import SwiftUI

struct VerseRow: View {
    @Environment(\.modelContext) private var modelContext
    
    let verse: Verse
    
    @State private var showDeleteAlert: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(verse.reference)
            Text(verse.fullVerse)
                .font(.footnote)
                .foregroundStyle(.secondary)
                .lineLimit(2)
        }
        .swipeActions(edge: .trailing) {
            Button("Delete", systemImage:"trash") {
                showDeleteAlert.toggle()
            }
            .tint(.red)
        }
        .alert("Delete Verse", isPresented: $showDeleteAlert) {
            Button("Cancel", role: .cancel) {}
            Button("Delete", role: .destructive) {
                let referenceToDelete = verse.reference
                let descriptor = FetchDescriptor<Verse>(predicate: #Predicate<Verse> {
                    $0.reference == referenceToDelete
                })
                
                if let versesToDelete = try? modelContext.fetch(descriptor) {
                    for verse in versesToDelete {
                        modelContext.delete(verse)
                    }
                }
                
                try? modelContext.save()
            }
        } message: {
            Text("It will be permanently removed from all collections.")
        }
    }
}

#Preview {
    List {
        VerseRow(verse: Verse.samples[0])
    }
}
