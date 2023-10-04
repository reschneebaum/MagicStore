//
//  SearchError.swift
//  MagicStore
//
//  Created by Rachel Schneebaum on 10/3/23.
//

import Foundation

struct SearchError: Error {
    var status: Int
    var code: String
    var details: String
    var type: String?
    var warnings: [String]?
}

extension SearchError: LocalizedError {
    var errorDescription: String? {
        "\(status) error: \(details)"
    }
}

extension SearchError: Codable {}
