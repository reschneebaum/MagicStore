//
//  Card.swift
//  MagicStore
//
//  Created by Rachel Schneebaum on 10/3/23.
//

import SwiftUI
import SwiftData

@Model
final class Card {
    var name: String
    @Attribute(.unique)
    var cardID: String
    @Attribute(.externalStorage)
    var imageData: Data?
    
    init(name: String, id: String, imageData: Data?) {
        self.name = name
        self.cardID = id
        self.imageData = imageData
    }
}

extension Card {
    @MainActor
    convenience init(_ result: SearchResult, image: Image?) {
        self.init(
            name: result.name,
            id: result.scryfallID,
            imageData: image?.uiImage?.pngData()
        )
    }
}
