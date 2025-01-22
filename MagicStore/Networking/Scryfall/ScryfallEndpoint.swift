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
	
	// examples
	case examplePost(Data)
	case exampleAuthRequired(String)
	
    
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
			
		case .exampleAuthRequired, .examplePost:
			"/fake-endpoint"
        }
    }
    
    var httpMethod: HTTPMethod {
		switch self {
		case .nameSearch, .random:
			return .get
			
		case .examplePost:
			return .post
		case .exampleAuthRequired:
			return .get
		}
    }
	
	var httpBody: Data? {
		switch self {
		case .nameSearch, .random:
			return nil
			
		case .examplePost(let data):
			return data
		case .exampleAuthRequired:
			return nil
		}
	}
    
    var httpHeaders: [String: String]? {
		switch self {
		case .nameSearch, .random:
			return nil
			
		case .examplePost:
			return nil
		case .exampleAuthRequired(let token):
			return ["Authentication": "Bearer \(token)"]
		}
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .nameSearch(let string):
            return [URLQueryItem(name: "q", value: "o:\(string)")]
        case .random:
			return nil
			
		case .exampleAuthRequired, .examplePost:
			return nil
        }
    }
}
