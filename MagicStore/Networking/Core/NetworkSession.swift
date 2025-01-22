//
//  NetworkSession.swift
//  MagicStore
//
//  Created by Rachel Schneebaum on 10/3/23.
//

import Foundation

// This type exists to allow for dependency injection of URLSession in the network service and make testing easier
// It definitely isn't needed for networking (and in fact you'd have to add additional methods to handle anything more
// than the existing async `data(for:_:)` method

protocol NetworkSession {
    func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
}

extension NetworkSession {
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        try await data(for: request, delegate: nil)
    }
}

// MARK: URLSession

extension URLSession: NetworkSession {}
