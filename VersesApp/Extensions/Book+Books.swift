//
//  Book+Books.swift
//  VersesApp
//
//  Created by Jason Bullard on 7/5/25.
//

extension Book {
    // Old Testament
    static let Genesis = Book(id: 1, name: "Genesis", abbreviation: "Gen", chapters: [31, 25, 24, 26, 32, 22, 24, 22, 29, 32, 32, 20, 18, 24, 21, 16, 27, 33, 38, 18, 34, 24, 20, 67, 34, 35, 46, 22, 35, 43, 55, 32, 20, 31, 29, 43, 36, 30, 23, 23, 57, 38, 34, 34, 28, 34, 31, 22, 33, 26], testament: .old)
    static let Exodus = Book(id: 2, name: "Exodus", abbreviation: "Exod", chapters: [22, 25, 22, 31, 23, 30, 25, 32, 35, 29, 10, 51, 22, 31, 27, 36, 16, 27, 25, 26, 36, 31, 33, 18, 40, 37, 21, 43, 46, 38, 18, 35, 23, 35, 35, 38, 29, 31, 43, 38], testament: .old)
    static let Leviticus = Book(id: 3, name: "Leviticus", abbreviation: "Lev", chapters: [17, 16, 17, 35, 19, 30, 38, 36, 24, 20, 47, 8, 59, 57, 33, 34, 16, 30, 37, 27, 24, 33, 44, 23, 22, 17, 34], testament: .old)
    static let Numbers = Book(id: 4, name: "Numbers", abbreviation: "Num", chapters: [54, 34, 51, 49, 31, 27, 89, 26, 23, 36, 35, 16, 33, 45, 41, 50, 13, 32, 22, 29, 35, 41, 30, 25, 18, 65, 23, 31, 39, 17, 54, 42, 56, 29, 34, 13], testament: .old)
    static let Deuteronomy = Book(id: 5, name: "Deuteronomy", abbreviation: "Deut", chapters: [46, 37, 29, 49, 33, 25, 22, 20, 29, 22, 32, 32, 18, 29, 23, 22, 20, 22, 21, 20, 23, 30, 25, 22, 19, 19, 26, 69, 28, 20, 30, 52, 29, 12], testament: .old)
    static let Joshua = Book(id: 6, name: "Joshua", abbreviation: "Josh", chapters: [18, 24, 17, 24, 15, 27, 26, 35, 27, 43, 23, 24, 33, 15, 63, 10, 18, 28, 51, 9, 45, 34, 16, 33], testament: .old)
    static let Judges = Book(id: 7, name: "Judges", abbreviation: "Judg", chapters: [36, 23, 31, 24, 31, 40, 25, 35, 57, 18, 40, 15, 25, 20, 20, 31, 13, 31, 30, 48, 25], testament: .old)
    static let Ruth = Book(id: 8, name: "Ruth", abbreviation: "Ruth", chapters: [22, 23, 18, 22], testament: .old)
    static let Samuel1 = Book(id: 9, name: "1 Samuel", abbreviation: "1Sam", chapters: [28, 36, 21, 22, 12, 21, 17, 22, 27, 27, 15, 25, 23, 52, 35, 23, 58, 30, 24, 42, 15, 23, 29, 22, 44, 25, 12, 25, 11, 31, 13], testament: .old)
    static let Samuel2 = Book(id: 10, name: "2 Samuel", abbreviation: "2Sam", chapters: [27, 32, 39, 12, 25, 23, 29, 18, 13, 19, 27, 31, 39, 33, 37, 23, 29, 33, 43, 26, 22, 51, 39, 25], testament: .old)
    static let Kings1 = Book(id: 11, name: "1 Kings", abbreviation: "1Kings", chapters: [53, 46, 28, 20, 32, 38, 51, 66, 28, 29, 43, 33, 34, 31, 34, 34, 24, 46, 21, 43, 29, 53], testament: .old)
    static let Kings2 = Book(id: 12, name: "2 Kings", abbreviation: "2Kings", chapters: [18, 25, 27, 44, 27, 33, 20, 29, 37, 36, 21, 21, 25, 29, 38, 20, 41, 37, 37, 21, 26, 20, 37, 20, 30], testament: .old)
    static let Chronicles1 = Book(id: 13, name: "1 Chronicles", abbreviation: "1Chron", chapters: [54, 55, 24, 43, 26, 81, 40, 40, 44, 14, 47, 40, 14, 17, 29, 43, 27, 17, 19, 8, 30, 19, 32, 31, 31, 32, 34, 21, 30], testament: .old)
    static let Chronicles2 = Book(id: 14, name: "2 Chronicles", abbreviation: "2Chron", chapters: [17, 18, 17, 22, 14, 42, 22, 18, 31, 19, 23, 16, 22, 15, 19, 14, 19, 34, 11, 37, 20, 12, 21, 27, 28, 23, 9, 27, 36, 27, 21, 33, 25, 33, 27, 23], testament: .old)
    static let Ezra = Book(id: 15, name: "Ezra", abbreviation: "Ezra", chapters: [11, 70, 13, 24, 17, 22, 28, 36, 15, 44], testament: .old)
    static let Nehemiah = Book(id: 16, name: "Nehemiah", abbreviation: "Neh", chapters: [11, 20, 32, 23, 19, 19, 73, 18, 38, 39, 36, 47, 31], testament: .old)
    static let Esther = Book(id: 17, name: "Esther", abbreviation: "Esther", chapters: [22, 23, 15, 17, 14, 14, 10, 17, 32, 3], testament: .old)
    static let Job = Book(id: 18, name: "Job", abbreviation: "Job", chapters: [22, 13, 26, 21, 27, 30, 21, 22, 35, 22, 20, 25, 28, 22, 35, 22, 16, 21, 29, 29, 34, 30, 17, 25, 6, 14, 20, 28, 25, 31, 40, 22, 33, 37, 16, 33, 24, 41, 30, 24, 34, 17], testament: .old)
    static let Psalm = Book(id: 19, name: "Psalm", abbreviation: "Psalms", chapters: [6, 12, 8, 8, 12, 10, 17, 9, 20, 18, 7, 8, 6, 7, 5, 11, 15, 50, 14, 9, 13, 31, 6, 10, 22, 12, 14, 9, 11, 12, 24, 11, 22, 22, 28, 12, 40, 22, 13, 17, 13, 11, 5, 26, 17, 11, 9, 14, 20, 23, 19, 9, 6, 7, 23, 13, 11, 11, 17, 12, 8, 12, 11, 10, 13, 20, 7, 35, 36, 5, 24, 20, 28, 23, 10, 12, 20, 72, 13, 19, 16, 8, 18, 12, 13, 17, 7, 18, 52, 17, 16, 15, 5, 23, 11, 13, 12, 9, 9, 5, 8, 28, 22, 35, 45, 48, 43, 13, 31, 7, 10, 10, 9, 8, 18, 19, 2, 29, 176, 7, 8, 9, 4, 8, 5, 6, 5, 6, 8, 8, 3, 18, 3, 3, 21, 26, 9, 8, 24, 14, 10, 8, 12, 15, 21, 10, 20, 14, 9, 6], testament: .old)
    static let Proverbs = Book(id: 20, name: "Proverbs", abbreviation: "Prov", chapters: [33, 22, 35, 27, 23, 35, 27, 36, 18, 32, 31, 28, 25, 35, 33, 33, 28, 24, 29, 30, 31, 29, 35, 34, 28, 28, 27, 28, 27, 33, 31], testament: .old)
    static let Ecclesiastes = Book(id: 21, name: "Ecclesiastes", abbreviation: "Eccles", chapters: [18, 26, 22, 16, 20, 12, 29, 17, 18, 20, 10, 14], testament: .old)
    static let SongOfSolomon = Book(id: 22, name: "Song Of Solomon", abbreviation: "Song", chapters: [17, 17, 11, 16, 16, 13, 13, 14], testament: .old)
    static let Isaiah = Book(id: 23, name: "Isaiah", abbreviation: "Isa", chapters: [31, 22, 26, 6, 30, 13, 25, 22, 21, 34, 16, 6, 22, 32, 9, 14, 14, 7, 25, 6, 17, 25, 18, 23, 12, 21, 13, 29, 24, 33, 9, 20, 24, 17, 10, 22, 38, 22, 8, 31, 29, 25, 28, 28, 25, 13, 15, 22, 26, 11, 23, 15, 12, 17, 13, 12, 21, 14, 21, 22, 11, 12, 19, 12, 25, 24, 22, 11, 12, 19, 11, 25], testament: .old)
    static let Jeremiah = Book(id: 24, name: "Jeremiah", abbreviation: "Jer", chapters: [19, 37, 25, 31, 31, 30, 34, 22, 26, 25, 23, 17, 27, 22, 21, 21, 27, 23, 15, 18, 14, 30, 40, 10, 38, 24, 22, 17, 32, 24, 40, 44, 26, 22, 19, 32, 21, 28, 18, 16, 18, 22, 13, 30, 5, 28, 7, 47, 39, 46, 64, 34], testament: .old)
    static let Lamentations = Book(id: 25, name: "Lamentations", abbreviation: "Lam", chapters: [22, 22, 66, 22, 22], testament: .old)
    static let Ezekiel = Book(id: 26, name: "Ezekiel", abbreviation: "Ezek", chapters: [28, 10, 27, 17, 17, 14, 27, 18, 11, 22, 25, 28, 23, 23, 8, 63, 24, 32, 14, 49, 32, 31, 49, 27, 17, 21, 36, 26, 21, 26, 18, 32, 33, 31, 15, 38, 28, 23, 29, 49, 26, 20, 27, 31, 25, 24, 23, 35], testament: .old)
    static let Daniel = Book(id: 27, name: "Daniel", abbreviation: "Dan", chapters: [21, 49, 30, 37, 31, 28, 28, 27, 27, 21, 45, 13], testament: .old)
    static let Hosea = Book(id: 28, name: "Hosea", abbreviation: "Hosea", chapters: [11, 23, 5, 19, 15, 11, 16, 14, 17, 15, 12, 14, 16, 9], testament: .old)
    static let Joel = Book(id: 29, name: "Joel", abbreviation: "Joel", chapters: [20, 32, 21], testament: .old)
    static let Amos = Book(id: 30, name: "Amos", abbreviation: "Amos", chapters: [15, 16, 15, 13, 27, 14, 17, 14, 15], testament: .old)
    static let Obadiah = Book(id: 31, name: "Obadiah", abbreviation: "Obad", chapters: [21], testament: .old)
    static let Jonah = Book(id: 32, name: "Jonah", abbreviation: "Jonah", chapters: [17, 10, 10, 11], testament: .old)
    static let Micah = Book(id: 33, name: "Micah", abbreviation: "Micah", chapters: [16, 13, 12, 13, 15, 16, 20], testament: .old)
    static let Nahum = Book(id: 34, name: "Nahum", abbreviation: "Nah", chapters: [15, 13, 19], testament: .old)
    static let Habakkuk = Book(id: 35, name: "Habakkuk", abbreviation: "Hab", chapters: [17, 20, 19], testament: .old)
    static let Zephaniah = Book(id: 36, name: "Zephaniah", abbreviation: "Zeph", chapters: [18, 15, 20], testament: .old)
    static let Haggai = Book(id: 37, name: "Haggai", abbreviation: "Haggai", chapters: [15, 23], testament: .old)
    static let Zechariah = Book(id: 38, name: "Zechariah", abbreviation: "Zech", chapters: [21, 13, 10, 14, 11, 15, 14, 23, 17, 12, 17, 14, 9, 21], testament: .old)
    static let Malachi = Book(id: 39, name: "Malachi", abbreviation: "Mal", chapters: [14, 17, 18, 6], testament: .old)
    static let Matthew = Book(id: 40, name: "Matthew", abbreviation: "Matt", chapters: [25, 23, 17, 25, 48, 34, 29, 34, 38, 42, 30, 50, 58, 36, 39, 28, 27, 35, 30, 34, 46, 46, 39, 51, 46, 75, 66, 20], testament: .new)
    static let Mark = Book(id: 41, name: "Mark", abbreviation: "Mark", chapters: [45, 28, 35, 41, 43, 56, 37, 38, 50, 52, 33, 44, 37, 72, 47, 20], testament: .new)
    static let Luke = Book(id: 42, name: "Luke", abbreviation: "Luke", chapters: [80, 52, 38, 44, 39, 49, 50, 56, 62, 42, 54, 59, 35, 35, 32, 31, 37, 43, 48, 47, 38, 71, 56, 53], testament: .new)
    static let John = Book(id: 43, name: "John", abbreviation: "John", chapters: [51, 25, 36, 54, 47, 71, 53, 59, 41, 42, 57, 50, 38, 31, 27, 33, 26, 40, 42, 31, 25], testament: .new)
    static let Acts = Book(id: 44, name: "Acts", abbreviation: "Acts", chapters: [26, 47, 26, 37, 42, 15, 60, 40, 43, 48, 30, 25, 52, 28, 41, 40, 34, 28, 41, 38, 40, 30, 35, 27, 27, 32, 44, 31], testament: .new)
    static let Romans = Book(id: 45, name: "Romans", abbreviation: "Rom", chapters: [32, 29, 31, 25, 21, 23, 25, 39, 33, 21, 36, 21, 14, 23, 33, 27], testament: .new)
    static let Corinthians1 = Book(id: 46, name: "1 Corinthians", abbreviation: "1Cor", chapters: [31, 16, 23, 21, 13, 20, 40, 13, 27, 33, 34, 31, 13, 40, 58, 24], testament: .new)
    static let Corinthians2 = Book(id: 47, name: "2 Corinthians", abbreviation: "2Cor", chapters: [24, 17, 18, 18, 21, 18, 16, 24, 15, 18, 33, 21, 14], testament: .new)
    static let Galatians = Book(id: 48, name: "Galatians", abbreviation: "Gal", chapters: [24, 21, 29, 31, 26, 18], testament: .new)
    static let Ephesians = Book(id: 49, name: "Ephesians", abbreviation: "Eph", chapters: [23, 22, 21, 32, 33, 24], testament: .new)
    static let Philippians = Book(id: 50, name: "Philippians", abbreviation: "Phil", chapters: [30, 30, 21, 23], testament: .new)
    static let Colossians = Book(id: 51, name: "Colossians", abbreviation: "Col", chapters: [29, 23, 25, 18], testament: .new)
    static let Thessalonians1 = Book(id: 52, name: "1 Thessalonians", abbreviation: "1Thess", chapters: [10, 20, 13, 18, 28], testament: .new)
    static let Thessalonians2 = Book(id: 53, name: "2 Thessalonians", abbreviation: "2Thess", chapters: [12, 17, 18], testament: .new)
    static let Timothy1 = Book(id: 54, name: "1 Timothy", abbreviation: "1Tim", chapters: [20, 15, 16, 16, 25, 21], testament: .new)
    static let Timothy2 = Book(id: 55, name: "2 Timothy", abbreviation: "2Tim", chapters: [18, 26, 17, 22], testament: .new)
    static let Titus = Book(id: 56, name: "Titus", abbreviation: "Tit", chapters: [16, 15, 15], testament: .new)
    static let Philemon = Book(id: 57, name: "Philemon", abbreviation: "Phil", chapters: [25], testament: .new)
    static let Hebrews = Book(id: 58, name: "Hebrews", abbreviation: "Heb", chapters: [14, 18, 19, 16, 14, 20, 28, 13, 28, 39, 40, 29, 25], testament: .new)
    static let James = Book(id: 59, name: "James", abbreviation: "James", chapters: [27, 26, 18, 17, 20], testament: .new)
    static let Peter1 = Book(id: 60, name: "1 Peter", abbreviation: "1Peter", chapters: [25, 25, 22, 19, 14], testament: .new)
    static let Peter2 = Book(id: 61, name: "2 Peter", abbreviation: "2Peter", chapters: [21, 22, 18], testament: .new)
    static let John1 = Book(id: 62, name: "1 John", abbreviation: "1John", chapters: [10, 29, 24, 21, 21], testament: .new)
    static let John2 = Book(id: 63, name: "2 John", abbreviation: "2John", chapters: [13], testament: .new)
    static let John3 = Book(id: 64, name: "3 John", abbreviation: "3John", chapters: [14], testament: .new)
    static let Jude = Book(id: 65, name: "Jude", abbreviation: "Jude", chapters: [25], testament: .new)
    static let Revelation = Book(id: 66, name: "Revelation", abbreviation: "Rev", chapters: [20, 29, 22, 11, 14, 17, 17, 13, 21, 11, 19, 17, 18, 20, 8, 21, 18, 24, 21, 15, 27, 21], testament: .new)
    
    static let oldTestament = [Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, Samuel1, Samuel2, Kings1, Kings2, Chronicles1, Chronicles2, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, SongOfSolomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi]
    
    static let newTestament = [Matthew, Mark, Luke, John, Acts, Romans, Corinthians1, Corinthians2, Galatians, Ephesians, Philippians, Colossians, Thessalonians1, Thessalonians2, Timothy1, Timothy2, Titus, Philemon, Hebrews, James, Peter1, Peter2, John1, John2, John3, Jude, Revelation]
    
    static let all = oldTestament + newTestament
}
