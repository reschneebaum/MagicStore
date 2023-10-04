//
//  Images.swift
//  MagicStore
//
//  Created by Rachel Schneebaum on 10/3/23.
//

import Foundation

struct Images {
    /// Thumbnail-size image
    var small: String?
    var normal: String?
    var large: String?
    /// A transparent, rounded full card PNG.
    /// This is the best image to use for videos or other high-quality content.
    var png: String?
    /// A rectangular crop of the card’s art only.
    /// Not guaranteed to be perfect for cards with outlier designs or strange frame arrangements
    var artCrop: String?
    /// A full card image with the rounded corners and the majority of the border cropped off.
    /// Designed for dated contexts where rounded images can’t be used.
    var borderCrop: String?
}

// MARK: Codable

extension Images: Codable {
    enum CodingKeys: String, CodingKey {
        case small, normal, large, png
        case artCrop = "art_crop"
        case borderCrop = "border_crop"
    }
}
