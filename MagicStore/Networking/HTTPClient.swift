//
//  HTTPClient.swift
//  MagicStore
//
//  Created by Rachel Schneebaum on 10/3/23.
//

import Foundation

protocol HTTPClient {
    var urlSession: URLSessionInterface { get }
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T
}

extension HTTPClient {
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        guard let urlRequest = endpoint.urlRequest else {
            throw NetworkError.badRequest
        }

        let (data, response) = try await urlSession.data(for: urlRequest)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.noResponse
        }
        
        guard 200..<300 ~= httpResponse.statusCode else {
            // TODO: Handle different error response codes
            throw NetworkError.requestFailure(httpResponse.statusCode)
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}
