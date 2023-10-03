//
//  CardSearchView.swift
//  MagicStore
//
//  Created by Rachel Schneebaum on 10/3/23.
//

import SwiftUI

struct CardSearchView: View {
    @State private var searchText = ""
    @State private var results: [SearchResult] = []
    
    var body: some View {
        List {
            ForEach(self.results) {
                SearchResultView(result: $0)
            }
        }
        .searchable(
            text: $searchText,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Search"
        )
        .navigationTitle("Card Search")
    }
}

private struct SearchResultView: View {
    var result: SearchResult
    
    var body: some View {
        VStack {
            Text("\(result.name)")
        }
    }
}

#Preview {
    NavigationStack {
        CardSearchView()
    }
}
