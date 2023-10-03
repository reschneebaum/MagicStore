//
//  Item.swift
//  MagicStore
//
//  Created by Rachel Schneebaum on 10/3/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
