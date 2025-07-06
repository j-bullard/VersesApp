//
//  VersePickerView.swift
//  VersesApp
//
//  Created by Jason Bullard on 7/5/25.
//

import SwiftUI

struct VersePickerView: View {
    enum NavigationStep: Hashable {
        case chapter(Book)
        case startVerse(Book, Int)
        case endVerse(Book, Int, Int)
    }
    
    @Binding var path: NavigationPath
    @Binding var verse: SelectedVerse
    
    var body: some View {
        bookPicker
            .navigationDestination(for: NavigationStep.self) { step in
                switch step {
                case .chapter(let book):
                    chapterPicker(book)
                case .startVerse(let book, let chapter):
                    startVersePicker(book, chapter)
                case .endVerse(let book, let chapter, let start):
                    endVersePicker(book, chapter, start)
                }
            }
    }
    
    
    @ViewBuilder
    var bookPicker: some View {
        List(Book.all) { book in
            NavigationLink(value: NavigationStep.chapter(book)) {
                Text(book.name)
            }
        }
        .navigationTitle("Book")
    }
    
    @ViewBuilder
    func chapterPicker(_ book: Book) -> some View {
        List {
            ForEach(1...(book.chapters.count), id: \.self) { chapter in
                NavigationLink(value: NavigationStep.startVerse(book, chapter)) {
                    Text("Chapter \(chapter)")
                }
            }
        }
        .navigationTitle(book.name)
    }
    
    @ViewBuilder
    func startVersePicker(_ book: Book, _ chapter: Int) -> some View {
        List {
            ForEach(1...book.chapters[chapter - 1], id: \.self) { verse in
                NavigationLink(value: NavigationStep.endVerse(book, chapter, verse)) {
                    Text("Verse \(verse)")
                }
            }
        }
        .navigationTitle("\(book.name) \(chapter)")
    }
    
    @ViewBuilder
    func endVersePicker(_ book: Book, _ chapter: Int, _ startVerse: Int) -> some View {
        List {
            ForEach(startVerse...book.chapters[chapter - 1], id: \.self) { verse in
                Button {
                    self.verse = SelectedVerse(book: book, chapter: chapter, startVerse: startVerse, endVerse: verse)
                    path = NavigationPath()
                } label: {
                    HStack {
                        Text("Verse \(verse)")
                        Spacer()
                        if startVerse == verse {
                            Text("(Single verse)").font(.caption).foregroundStyle(.secondary)
                        } else {
                            Text("(\(startVerse)-\(verse))").font(.caption).foregroundStyle(.secondary)
                        }
                    }
                    .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
            }
        }
        .navigationTitle("\(book.name) \(chapter):\(startVerse)")
    }
}

#Preview {
    VersePickerView(
        path: .constant(NavigationPath()),
        verse: .constant(SelectedVerse(book: Book.Genesis, chapter: 1, startVerse: 1, endVerse: 1))
    )
}
