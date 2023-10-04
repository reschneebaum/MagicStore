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
