//
//  MyCardsView.swift
//  MagicStore
//
//  Created by Rachel Schneebaum on 10/3/23.
//

import SwiftUI
import SwiftData

struct MyCardsView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var cards: [Card]
    
    var body: some View {
        List {
            ForEach(cards) {
                Text($0.name)
            }
        }
    }
}

#Preview {
    NavigationStack {
        MyCardsView()
            .navigationTitle("My Cards")
    }
    .modelContainer(for: Card.self, inMemory: true)
}
