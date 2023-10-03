//
//  MyCardsView.swift
//  MagicStore
//
//  Created by Rachel Schneebaum on 10/3/23.
//

import SwiftUI

struct MyCardsView: View {
    @State var cards: [Card]
    
    var body: some View {
        List {
            ForEach(cards) {
                Text($0.name)
            }
        }
        .navigationTitle("My Cards")
    }
}

#Preview {
    NavigationStack {
        MyCardsView(cards: [.init(name: "test", id: "test-id")])
    }
}
