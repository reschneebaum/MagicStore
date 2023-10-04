//
//  NetworkError.swift
//  MagicStore
//
//  Created by Rachel Schneebaum on 10/3/23.
//

import Foundation

enum NetworkError: Error {
    case badRequest
    case noResponse
    case requestFailure(_ statusCode: Int)
}

// MARK: LocalizedError

extension NetworkError: LocalizedError {
    // TODO: Localize strings!
    var errorDescription: String? {
        switch self {
        case .badRequest:
            return "Unable to initialize and/or use the given url/urlRequest"
        case .noResponse:
            return "No response, or no parseable response, from API"
        case let .requestFailure(statusCode):
            return "Request failed with status code \(statusCode)"
        }
    }
}
