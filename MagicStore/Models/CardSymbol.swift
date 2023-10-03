//
//  CardSymbol.swift
//  MagicStore
//
//  Created by Rachel Schneebaum on 10/3/23.
//

import Foundation

struct CardSymbol {
    var object = "card_symbol"
    var symbol: String
    var svg: String
    var isMana: Bool
    var manaValue: Int
    var english: String
    var colors: [ManaColor] = []
    var convertedManaCost: Double?
}

extension CardSymbol: Codable {
    enum CodingKeys: String, CodingKey {
        case object, symbol, english, colors
        case svg = "svg_uri"
        case isMana = "represents_mana"
        case manaValue = "mana_value"
        case convertedManaCost = "cmc"
    }
}
