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
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(collection.theme.mainColor)
                    .frame(width: 32, height: 32)
                
                Image(systemName: collection.icon)
                    .foregroundStyle(collection.theme.accentColor)
                    .font(.system(size: 16, weight: .semibold))
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
            .previewDataContainer()
    }
}
