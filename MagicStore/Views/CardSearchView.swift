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
    private let service: ScryfallNetworkService = .init()
    
    var body: some View {
        List {
            Button("random") {
                Task {
                    do {
                        let result = try await service.random()
                        results = [result]
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            
            ForEach(self.results) {
                SearchResultView(result: $0)
            }
        }
        .searchable(
            text: $searchText,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Search"
        )
        .onSubmit(of: .search) {
            Task {
                do {
                    results = try await service.search(searchText).data
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        .navigationTitle("Card Search")
    }
}

private struct SearchResultView: View {
    var result: SearchResult
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(result.name)")
            
            if let urlString = result.images?.normal {
                AsyncImage(url: .init(string: urlString)) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    Color.gray.clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        CardSearchView()
    }
}
