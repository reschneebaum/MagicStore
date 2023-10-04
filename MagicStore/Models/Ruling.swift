//
//  Ruling.swift
//  MagicStore
//
//  Created by Rachel Schneebaum on 10/3/23.
//

import Foundation

struct Ruling {
    var oracleID: String
    var source: Source
    var publishDateString: String
    var comment: String
}

extension Ruling: Codable {
    enum CodingKeys: String, CodingKey {
        case oracleID = "oracle_id"
        case source, comment
        case publishDateString = "published_at"
    }
}

extension Ruling {
    enum Source: String, Codable {
        case scryfall
        case wotc
    }
}
