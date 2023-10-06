//
//  ScryfallEndpoint.swift
//  MagicStore
//
//  Created by Rachel Schneebaum on 10/3/23.
//

import Foundation

enum ScryfallEndpoint: Endpoint {
    case nameSearch(String)
    case random
    
    var scheme: String {
        "https"
    }
    
    var host: String {
        "api.scryfall.com"
    }
    
    var path: String {
        switch self {
        case .nameSearch: "/cards/search"
        case .random: "/cards/random"
        }
    }
    
    var httpMethod: HTTPMethod {
        .get
    }
    
    var httpHeaders: [String: String]? {
        nil
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .nameSearch(let string):
            [URLQueryItem(name: "q", value: "o:\(string)")]
        case .random: nil
        }
    }
}
