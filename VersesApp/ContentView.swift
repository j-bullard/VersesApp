//
//  ContentView.swift
//  VersesApp
//
//  Created by Jason Bullard on 7/5/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab {
                Text("Review")
            } label: {
                Label("Review", systemImage: "target")
                    .environment(\.symbolVariants, .none)
            }
            
            Tab {
                Text("Library")
            } label: {
                Label("Library", systemImage: "books.vertical")
                    .environment(\.symbolVariants, .none)
            }
            
            Tab {
                Text("Settings")
            } label: {
                Label("Settings", systemImage: "gearshape")
                    .environment(\.symbolVariants, .none)
            }
        }
    }
}

#Preview {
    ContentView()
}
