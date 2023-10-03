//
//  Mana.swift
//  MagicStore
//
//  Created by Rachel Schneebaum on 10/3/23.
//

import Foundation

enum ManaColor: String, Codable {
    case black = "B"
    case blue = "U"
    case green = "G"
    case red = "R"
    case white = "W"
    case colorless = "C"

    var rawSymbol: String {
        "{\(rawValue)}"
    }
}
