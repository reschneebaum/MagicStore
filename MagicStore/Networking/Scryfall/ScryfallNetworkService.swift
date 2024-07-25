//
//  ScryfallNetworkService.swift
//  MagicStore
//
//  Created by Rachel Schneebaum on 10/4/23.
//

import Foundation

final class ScryfallNetworkService: HTTPClient {
    typealias EndpointType = ScryfallEndpoint
    
    var urlSession: NetworkSession
    
    init(urlSession: NetworkSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func search(_ searchString: String) async throws -> SearchResults {
		let results: SearchResults = try await request(.nameSearch(searchString))
		print("results: \(results.data.map(\.name))")
		return results
    }
    
    func random() async throws -> SearchResult {
        try await request(.random)
    }
}
