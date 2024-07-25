//
//  CardSearchViewModel.swift
//  MagicStore
//
//  Created by Rachel Schneebaum on 11/13/23.
//

import Foundation

@Observable final class CardSearchViewModel {
    var searchText = ""
    var results: [SearchResult] = []
    var error: Error?
    private let service: ScryfallNetworkService
    
    init(service: ScryfallNetworkService = .init()) {
        self.service = service
    }
    
    func search() {
        guard !searchText.isEmpty else { return }
        Task {
            do {
                results = try await service.search(searchText).data
                error = nil
            } catch {
                self.error = error
                results = []
            }
        }
    }
    
    func getRandom() {
        Task {
            do {
                let result = try await service.random()
                results = [result]
                error = nil
            } catch {
                results = []
                self.error = error
            }
        }
    }
}
