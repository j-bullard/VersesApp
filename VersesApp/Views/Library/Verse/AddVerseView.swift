//
//  AddVerseView.swift
//  VersesApp
//
//  Created by Jason Bullard on 7/5/25.
//

import SwiftUI

struct SelectedVerse: Hashable {
    var book: Book
    var chapter: Int
    var startVerse: Int
    var endVerse: Int
    
    var reference: String {
        var reference = "\(book.name) \(chapter):\(startVerse)"
        if startVerse != endVerse {
            reference += "-\(endVerse)"
        }
        return reference
    }
    
    static let initial: Self = .init(book: .Genesis, chapter: 1, startVerse: 1, endVerse: 1)
}

struct AddVerseView: View {
    enum NavigationStep: Hashable {
        case book
    }
    
    let collection: Collection
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var selectedTranslation: Translation = .nasb
    @State private var selectedVerse: SelectedVerse = .initial
    @State private var dueDate: Date = Date()
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            Form {
                Section {
                    Picker(selection: $selectedTranslation) {
                        ForEach(Translation.allCases) { translation in
                            Text(translation.fullName)
                                .tag(translation)
                        }
                    } label: {
                        Label("Translation", systemImage: "character.book.closed")
                    } currentValueLabel: {
                        Text(self.selectedTranslation.abbreviation)
                    }
                    .pickerStyle(.navigationLink)
                    .buttonStyle(.plain)
                    
                    NavigationLink(value: NavigationStep.book) {
                        HStack {
                            Label("Verse", systemImage: "widget.small")
                            Spacer()
                            Text(selectedVerse.reference)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .buttonStyle(.plain)
                }
                
                Section {
                    DatePicker(selection: $dueDate, displayedComponents: [.date]) {
                        Label("Start Date", systemImage: "calendar")
                    }
                    .buttonStyle(.plain)
                }
            }
            .navigationTitle("Add Verse")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                toolbarContent
            }
            .navigationDestination(for: NavigationStep.self) { step in
                switch step {
                default:
                    VersePickerView(path: $path, verse: $selectedVerse)
                }
            }
        }
    }
    
    @ToolbarContentBuilder
    private var toolbarContent: some ToolbarContent {
        ToolbarItem(placement: .cancellationAction) {
            Button("Cancel") {
                dismiss()
            }
        }
        
        ToolbarItem(placement: .primaryAction) {
            Button("Done") {
                if !collection.verses.contains(where: { $0.reference == selectedVerse.reference }) {
                    let verse = Verse(
                        translation: selectedTranslation,
                        book: selectedVerse.book,
                        chapter: selectedVerse.chapter,
                        startVerse: selectedVerse.startVerse,
                        endVerse: selectedVerse.endVerse,
                        text: "",
                        reference: selectedVerse.reference
                    )
                    
                    modelContext.insert(verse)
                    collection.verses.append(verse)
                    try? modelContext.save()
                }
                dismiss()
            }
        }
    }
}

#Preview {
    AddVerseView(collection: Collection.samples[0])
}
