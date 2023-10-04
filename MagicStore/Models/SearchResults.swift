//
//  SearchResults.swift
//  MagicStore
//
//  Created by Rachel Schneebaum on 10/3/23.
//

import Foundation

struct SearchResult {
    var name = ""
    var scryfallID = ""
    var colorIdentity: [ManaColor] = []
    var colors: [ManaColor]?
    var keywords: [String] = []
    var power: String?
    var toughness: String?
    var manaCost: String?
    var producedMana: [ManaColor]?
    var typeText = ""
    var oracleText = ""
    var oracleID: String?
    var isReserved = false
    var releaseDateString: String?
    var images: Images?
}

extension SearchResult: Identifiable {
    var id: String {
        scryfallID
    }
}

extension SearchResult: Codable {
    enum CodingKeys: String, CodingKey {
        case name
        case scryfallID = "id"
        case colorIdentity = "color_identity"
        case colors
        case keywords
        case power
        case toughness
        case manaCost = "mana_cost"
        case producedMana = "mana_produced"
        case typeText = "type_line"
        case oracleText = "oracle_text"
        case oracleID = "oracle_id"
        case isReserved = "reserved"
        case releaseDateString = "released_at"
        case images = "image_uris"
    }
}

struct SearchResults {
    var totalCards: Int?
    var moreAvailable = false
    var nextPageURL: String?
    var data: [SearchResult] = []
}

extension SearchResults: Codable {
    enum CodingKeys: String, CodingKey {
        case totalCards = "total_cards"
        case moreAvailable = "has_more"
        case nextPageURL = "next_page"
        case data
    }
}
