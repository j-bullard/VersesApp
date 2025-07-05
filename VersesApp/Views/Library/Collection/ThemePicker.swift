//
//  ThemePicker.swift
//  VersesApp
//
//  Created by Jason Bullard on 7/5/25.
//

import SwiftUI

struct ThemePicker: View {
    @Binding var selection: Theme
    
    private let columns = [GridItem(.adaptive(minimum: 40))]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(Theme.allCases) { theme in
                Button(action: {
                    selection = theme
                }) {
                    Circle()
                        .fill(theme.mainColor)
                        .frame(width: 38, height: 38)
                        .overlay {
                            if selection == theme {
                                Circle()
                                    .stroke(Color(theme.mainColor), lineWidth: 2)
                                    .frame(width: 43, height: 43)
                            }
                        }
                }
                .padding(4)
                .buttonStyle(.plain)
                .accessibilityLabel(Text("Select \(selection.rawValue) theme"))
            }
        }
    }
}

#Preview {
    List {
        ThemePicker(selection: .constant(.blood))
    }
}
