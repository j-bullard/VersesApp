//
//  IconPicker.swift
//  VersesApp
//
//  Created by Jason Bullard on 7/5/25.
//

import SwiftUI

struct IconPicker: View {
    @Binding var selection: String
    
    private let columns = [GridItem(.adaptive(minimum: 40))]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(Collection.availableIcons, id: \.self) { icon in
                Button(action: {
                    selection = icon
                }){
                    ZStack {
                        Circle()
                            .frame(width: 38, height: 38)
                            .foregroundStyle(Color.black.opacity(0.1))
                        
                        Image(systemName: icon)
                            .font(.system(size: 18, weight: .semibold))
                    }
                    .overlay {
                        if selection == icon {
                            Circle()
                                .stroke(Color.black.opacity(0.5), lineWidth: 2)
                                .frame(width: 43, height: 43)
                        }
                    }
                }
                .padding(4)
                .buttonStyle(.plain)
                .accessibilityLabel(Text("Select \(icon) icon"))
            }
        }
    }
}

#Preview {
    List {
        IconPicker(selection: .constant(Collection.availableIcons[0]))
    }
}
