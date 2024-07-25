//
//  MockNetworkSession.swift
//  MagicStore
//
//  Created by Rachel Schneebaum on 11/13/23.
//

import Foundation

final class MockNetworkSession: NetworkSession {
    func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        var data: Data
        var response: HTTPURLResponse
        
        switch request.url?.lastPathComponent {
        case "search":
            let url = Bundle.main.url(forResource: "card-search", withExtension: "json")!
            data = try Data(contentsOf: url)
            response = .init(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            
        case "random":
            let url = Bundle.main.url(forResource: "random-card", withExtension: "json")!
            data = try Data(contentsOf: url)
            response = .init(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            
        default:
            data = .init()
            response = .init()
        }
    
        return (data, response)
    }
}
