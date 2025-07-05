//
//  CollectionFormView.swift
//  VersesApp
//
//  Created by Jason Bullard on 7/5/25.
//

import SwiftUI

struct CollectionFormView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    var collection: Collection? = nil
    
    @State private var name = ""
    @State private var icon = "folder.fill"
    @State private var theme: Theme = .blood
    
    private var isEditing: Bool {
        collection != nil
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Collection Name", text: $name)
                        .textInputAutocapitalization(.words)
                        .fontWeight(.semibold)
                        .foregroundStyle(theme.mainColor)
                        .id(theme.id)
                }
                
                Section {
                    ThemePicker(selection: $theme)
                }
                .listSectionSpacing(16)
                
                Section {
                    IconPicker(selection: $icon)
                }
            }
            .navigationTitle(isEditing ? "Edit Collection": "New Collection")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                toolbarContent
            }
            .onAppear {
                if isEditing {
                    self.name = collection!.name
                    self.icon = collection!.icon
                    self.theme = collection!.theme
                }
            }
        }
    }
    
    @ToolbarContentBuilder
    private var toolbarContent: some ToolbarContent {
        ToolbarItem(placement: .cancellationAction) {
            Button("Cancel") { dismiss() }
        }
        
        ToolbarItem(placement: .primaryAction) {
            Button("Done") {
                if let collection = collection {
                    collection.name = name
                    collection.icon = icon
                    collection.theme = theme
                } else {
                    let collection = Collection(name: name, icon: icon, theme: theme)
                    
                    modelContext.insert(collection)
                }
                
                try? modelContext.save()
                
                dismiss()
            }
            .disabled(name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
        }
    }
}

#Preview {
    CollectionFormView()
}
