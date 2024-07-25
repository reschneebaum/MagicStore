//
//  CardSearchView.swift
//  MagicStore
//
//  Created by Rachel Schneebaum on 10/3/23.
//

import SwiftUI

struct CardSearchView: View {
    @Bindable var viewModel: CardSearchViewModel = .init()
    
    var body: some View {
        List {
            ForEach(viewModel.results) {
                SearchResultView(result: $0)
            }
        }
        .searchable(
            text: $viewModel.searchText,
            placement: .navigationBarDrawer(displayMode: .always)
        )
        .onSubmit(of: .search, viewModel.search)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Random", action: viewModel.getRandom)
            }
        }
    }
}

private struct SearchResultView: View {
    var result: SearchResult
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(result.name)
            
            if let urlString = result.images?.normal {
                image(for: urlString)
            } else if let urlString = result.cardFaces?.first?.images?.normal {
                image(for: urlString)
            }
        }
    }
    
    private func image(for url: String) -> some View {
        AsyncImage(url: .init(string: url)) { image in
            image.resizable().scaledToFit()
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    NavigationStack {
        CardSearchView(viewModel: .init(service: .init(urlSession: MockNetworkSession())))
            .navigationTitle("Card Search")
    }
}
