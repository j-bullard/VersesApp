//
//  Collection+Icons.swift
//  VersesApp
//
//  Created by Jason Bullard on 7/5/25.
//

import Foundation

extension Collection {
    static let availableIcons: [String] = [
        "folder.fill",
        "tray.fill",
        "archivebox.fill",
        "document.fill",
        "book.fill",
        "book.pages.fill",
        "books.vertical.fill",
        "book.closed.fill",
        "text.book.closed.fill",
        "graduationcap.fill",
        "list.bullet",
        "person.fill",
        "person.2.fill",
        "figure.walk",
        "dumbbell.fill",
        "american.football.fill",
        "volleyball.fill",
        "trophy.fill",
        "globe.americas.fill",
        "sun.max.fill",
        "sparkles",
        "cloud.fill",
        "rainbow",
        "flame.fill",
        "music.quarternote.3",
        "heart.fill",
        "star.fill",
        "flag.fill",
        "bell.fill",
        "location.north.fill",
        "bolt.fill",
        "bubble.fill",
        "gearshape.fill",
        "cart.fill",
        "giftcard.fill",
        "wallet.bifold.fill",
        "light.beacon.max.fill",
        "party.popper.fill",
        "mountain.2.fill",
        "building.2.fill",
        "car.fill",
        "airplane",
        "cross.fill",
        "staroflife.fill",
        "bird.fill",
        "leaf.fill",
        "tree.fill",
        "crown.fill",
        "brain.fill",
        "mug.fill",
        "carrot.fill"
    ]
    
    static var defaultIcon: String {
        availableIcons.first ?? "folder.fill"
    }
    
    static func randomIcon() -> String {
        availableIcons.randomElement() ?? defaultIcon
    }
}
