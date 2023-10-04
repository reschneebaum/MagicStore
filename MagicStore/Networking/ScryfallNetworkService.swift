//
//  ScryfallNetworkService.swift
//  MagicStore
//
//  Created by Rachel Schneebaum on 10/4/23.
//

import Foundation

protocol ScryfallNetworkServiceInterface: HTTPClient {
    func search(_ searchString: String) async throws -> SearchResults
    func random() async throws -> SearchResult
}

final class ScryfallNetworkService: ScryfallNetworkServiceInterface {
    var urlSession: URLSessionInterface
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func search(_ searchString: String) async throws -> SearchResults {
        try await request(ScryfallEndpoint.nameSearch(searchString))
    }
    
    func random() async throws -> SearchResult {
        try await request(ScryfallEndpoint.random)
    }
}
