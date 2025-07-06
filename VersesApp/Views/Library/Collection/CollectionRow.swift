//
//  CollectionRow.swift
//  VersesApp
//
//  Created by Jason Bullard on 7/5/25.
//

import SwiftUI

struct CollectionRow: View {
    @Environment(\.modelContext) private var modelContext
    
    let collection: Collection
    
    @State private var showEditCollectionSheet = false
    @State private var showDeleteAlert: Bool = false
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .foregroundStyle(collection.theme.mainColor)
                    .frame(width: 30, height: 30)
                
                Image(systemName: collection.icon)
                    .foregroundStyle(collection.theme.accentColor)
                    .font(.system(size: 14, weight: .semibold))
                    .imageScale(.medium)
            }
            
            Text(collection.name)
            Spacer()
            Text("\(collection.verses.count)")
                .foregroundStyle(.secondary)
        }
        .swipeActions(edge: .trailing) {
            Button("Delete", systemImage: "trash") {
                if !collection.verses.isEmpty {
                    showDeleteAlert.toggle()
                } else {
                    deleteCollection()
                }
            }
            .tint(.red)
            
            Button("Edit", systemImage: "info.circle") {
                showEditCollectionSheet.toggle()
            }
        }
        .sheet(isPresented: $showEditCollectionSheet) {
            CollectionFormView(collection: collection)
        }
        .alert("Delete \"\(collection.name)\"", isPresented: $showDeleteAlert) {
            Button("Cancel", role: .cancel) {}
            Button("Delete", role: .destructive) {
                deleteCollection()
            }
        } message: {
            Text("Are you sure you want to delete this collection? All verses will be lost.")
        }
    }
    
    private func deleteCollection() {
        modelContext.delete(collection)
        
        try? modelContext.save()
    }
}

#Preview {
    List {
        CollectionRow(collection: Collection.samples[0])
        CollectionRow(collection: Collection.samples[1])
        CollectionRow(collection: Collection.samples[2])
        CollectionRow(collection: Collection.samples[3])
    }
    .previewDataContainer()
}
