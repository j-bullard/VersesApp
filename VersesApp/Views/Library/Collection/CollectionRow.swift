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
        }
        .swipeActions(edge: .trailing) {
            Button("Delete", systemImage: "trash", role: .destructive) {
                modelContext.delete(collection)
                
                try? modelContext.save()
            }
            
            Button("Edit", systemImage: "info.circle") {
                showEditCollectionSheet.toggle()
            }
        }
        .sheet(isPresented: $showEditCollectionSheet) {
            CollectionFormView(collection: collection)
        }
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
