//
//  Card.swift
//  MagicStore
//
//  Created by Rachel Schneebaum on 10/3/23.
//

import Foundation
import SwiftData

@Model
final class Card {
    var name: String
    var cardID: String
    
    init(name: String, id: String) {
        self.name = name
        self.cardID = id
    }
}

struct SearchResult {
    var name = ""
    var scryfallID = ""
    var colorIdentity: [ManaColor] = []
    var colors: [ManaColor]?
    var keywords = ""
    var power: Int
    var toughness: Int?
    var manaCost: Double?
    var producedMana: [ManaColor]?
    var typeText = ""
    var isReserved = false
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
        case isReserved = "reserved"
    }
}
