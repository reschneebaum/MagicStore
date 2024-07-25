//
//  CardFace.swift
//  MagicStore
//
//  Created by Rachel Schneebaum on 11/13/23.
//

import Foundation

struct CardFace {
    let name: String
    let manaCost: String
    let typeText: String
	var flavorName: String?
    var oracleText: String?
    var colors: [ManaColor]?
    var colorIndicator: [ManaColor]?
    var power: Int?
    var toughness: Int?
    var flavorText: String?
    var artist: String?
    var artistID: String?
    var images: Images?
}

// MARK: Codable

extension CardFace: Codable {
    private enum CodingKeys: String, CodingKey {
		case artist
		case artistID = "artist_id"
		case colorIndicator = "color_indicator"
		case colors
        case flavorName = "flavor_name"
		case flavorText = "flavor_text"
		case images = "image_uris"
        case manaCost = "mana_cost"
		case name
        case oracleText = "oracle_text"
        case power
        case toughness
		case typeText = "type_line"
    }
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		artist = try container.decodeIfPresent(String.self, forKey: .artist)
		artistID = try container.decodeIfPresent(String.self, forKey: .artistID)
		colorIndicator = try container.decodeIfPresent([ManaColor].self, forKey: .colorIndicator)
		colors = try container.decodeIfPresent([ManaColor].self, forKey: .colors)
		flavorName = try container.decodeIfPresent(String.self, forKey: .flavorName)
		flavorText = try container.decodeIfPresent(String.self, forKey: .flavorText)
		images = try container.decodeIfPresent(Images.self, forKey: .images)
		manaCost = try container.decodeIfPresent(String.self, forKey: .manaCost) ?? ""
		name = try container.decode(String.self, forKey: .name)
		oracleText = try container.decodeIfPresent(String.self, forKey: .oracleText)
		if let powerInt = try? container.decodeIfPresent(Int.self, forKey: .power) {
			power = powerInt
		} else if let powerString = try? container.decodeIfPresent(String.self, forKey: .power) {
			power = Int(powerString)
		}
		if let toughnessInt = try? container.decodeIfPresent(Int.self, forKey: .toughness) {
			toughness = toughnessInt
		} else if let toughnessString = try? container.decodeIfPresent(String.self, forKey: .toughness) {
			toughness = Int(toughnessString)
		}
		typeText = try container.decode(String.self, forKey: .typeText)
	}
}
