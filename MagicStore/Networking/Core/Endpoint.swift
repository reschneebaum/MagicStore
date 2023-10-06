//
//  Endpoint.swift
//  MagicStore
//
//  Created by Rachel Schneebaum on 10/3/23.
//

import Foundation

/// Specifies the properties required to create a `URLRequest` for a particular API endpoint.
protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var queryItems: [URLQueryItem]? { get }
    var httpHeaders: [String: String]? { get }
}

extension Endpoint {
    var urlRequest: URLRequest? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            return nil
        }
        
        var request: URLRequest = .init(url: url)
        request.httpMethod = httpMethod.rawValue
        request.allHTTPHeaderFields = httpHeaders
        
        return request
    }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}
