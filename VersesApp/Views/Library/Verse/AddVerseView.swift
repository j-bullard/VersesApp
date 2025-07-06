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
    
    private var verseText: [String] {
        BibleHelper.shared.getVerseStringSegments(
            translation: selectedTranslation,
            bookName: selectedVerse.book.name,
            chapter: selectedVerse.chapter,
            range: selectedVerse.startVerse...selectedVerse.endVerse
        )
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
                    ForEach(0...(selectedVerse.endVerse - selectedVerse.startVerse), id: \.self) { index in
                        HStack(alignment: .firstTextBaseline, spacing: 4) {
                            Text("\(selectedVerse.startVerse + index)")
                                .font(.footnote)
                                .fontWeight(.medium)
                                .foregroundColor(.secondary)
                                .padding(.top, 2)
                            Text(verseText[index])
                                .font(.callout)
                                .lineSpacing(2)
                                .fixedSize(horizontal: false, vertical: true)
                            Spacer()
                        }
                    }
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
                    createVerse()
                }
                dismiss()
            }
        }
    }
    
    private func createVerse() {
        let translation = selectedTranslation
        let book = selectedVerse.book
        let chapter = selectedVerse.chapter
        let startVerse = selectedVerse.startVerse
        let endVerse = selectedVerse.endVerse
        let reference = selectedVerse.reference
        
        let verse = Verse(
            translation: translation,
            book: book,
            chapter: chapter,
            startVerse: startVerse,
            endVerse: endVerse,
            reference: reference
        )
        
        let verseStringSegments = BibleHelper.shared.getVerseStringSegments(
            translation: translation,
            bookName: book.name,
            chapter: chapter,
            range: startVerse...endVerse
        )
        
        for (index, text) in verseStringSegments.enumerated() {
            let segment = VerseSegment(text: text, verseNumber: startVerse + index, order: index)
            verse.segments.append(segment)
        }
        
        modelContext.insert(verse)
        collection.verses.append(verse)
        try? modelContext.save()
    }
}

#Preview {
    AddVerseView(collection: Collection.samples[0])
}
