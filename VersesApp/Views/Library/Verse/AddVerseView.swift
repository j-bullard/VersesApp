//
//  AddVerseView.swift
//  VersesApp
//
//  Created by Jason Bullard on 7/5/25.
//

import SwiftUI

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
    
    private var versesText: [String] {
        BibleHelper.shared.getVerses(translation: selectedTranslation, bookName: selectedVerse.book.name, chapter: selectedVerse.chapter, verseRange: selectedVerse.startVerse...selectedVerse.endVerse)
    }
    
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
                
                Section("Scripture") {
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(0...(selectedVerse.endVerse - selectedVerse.startVerse), id: \.self) { index in
                            HStack(alignment: .firstTextBaseline, spacing: 4) {
                                Text("\(selectedVerse.startVerse + index)")
                                    .font(.footnote)
                                    .fontWeight(.medium)
                                    .foregroundColor(.secondary)
                                    .padding(.top, 2)
                                Text(versesText[index])
                                    .font(.callout)
                                    .lineSpacing(2)
                                    .fixedSize(horizontal: false, vertical: true)
                                Spacer()
                            }
                        }
                    }
                    .padding(.horizontal, 8)
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
                        content: versesText,
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
