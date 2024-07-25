//
//  SearchResults.swift
//  MagicStore
//
//  Created by Rachel Schneebaum on 10/3/23.
//

import Foundation

struct SearchResult {
    let name: String
    let scryfallID: String
    var colorIdentity: [ManaColor]?
    var colors: [ManaColor]?
    var keywords: [String]?
    var power: Int?
    var toughness: Int?
    var manaCost: String?
    var producedMana: [ManaColor]?
    let typeText: String
    var flavorText: String?
    var oracleText: String?
    var oracleID: String?
    var isReserved = false
    var releaseDateString: String?
    var images: Images?
    var cardFaces: [CardFace]?
}

// MARK: Identifiable

extension SearchResult: Identifiable {
    var id: String {
        scryfallID
    }
}

// MARK: Codable

extension SearchResult: Codable {
    enum CodingKeys: String, CodingKey {
		case cardFaces = "card_faces"
		case colorIdentity = "color_identity"
		case colors
		case flavorText = "flavor_text"
		case images = "image_uris"
		case isReserved = "reserved"
        case keywords
		case manaCost = "mana_cost"
		case name
		case oracleID = "oracle_id"
		case oracleText = "oracle_text"
        case power
		case producedMana = "mana_produced"
		case releaseDateString = "released_at"
		case scryfallID = "id"
        case toughness
        case typeText = "type_line"
    }
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		cardFaces = try container.decodeIfPresent([CardFace].self, forKey: .cardFaces)
		colorIdentity = try container.decodeIfPresent([ManaColor].self, forKey: .colorIdentity)
		colors = try container.decodeIfPresent([ManaColor].self, forKey: .colors)
		flavorText = try container.decodeIfPresent(String.self, forKey: .flavorText)
		images = try container.decodeIfPresent(Images.self, forKey: .images)
		isReserved = try container.decodeIfPresent(Bool.self, forKey: .isReserved) == true
		keywords = try container.decodeIfPresent([String].self, forKey: .keywords)
		manaCost = try container.decodeIfPresent(String.self, forKey: .manaCost)
		name = try container.decode(String.self, forKey: .name)
		oracleID = try container.decodeIfPresent(String.self, forKey: .oracleID)
		oracleText = try container.decodeIfPresent(String.self, forKey: .oracleText)
		if let powerInt = try? container.decodeIfPresent(Int.self, forKey: .power) {
			power = powerInt
		} else if let powerString = try? container.decodeIfPresent(String.self, forKey: .power) {
			power = Int(powerString)
		}
		producedMana = try container.decodeIfPresent([ManaColor].self, forKey: .producedMana)
		releaseDateString = try container.decodeIfPresent(String.self, forKey: .releaseDateString)
		scryfallID = try container.decode(String.self, forKey: .scryfallID)
		if let toughnessInt = try? container.decodeIfPresent(Int.self, forKey: .toughness) {
			toughness = toughnessInt
		} else if let toughnessString = try? container.decodeIfPresent(String.self, forKey: .toughness) {
			toughness = Int(toughnessString)
		}
		typeText = try container.decode(String.self, forKey: .typeText)
	}
}

// MARK: - SearchResults

struct SearchResults {
    var totalCards: Int?
    var moreAvailable = false
    var nextPageURL: String?
    var data: [SearchResult] = []
}

// MARK: Codable

extension SearchResults: Codable {
    enum CodingKeys: String, CodingKey {
        case totalCards = "total_cards"
        case moreAvailable = "has_more"
        case nextPageURL = "next_page"
        case data
    }
}
