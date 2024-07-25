//
//  Image+UIImage.swift
//  MagicStore
//
//  Created by Rachel Schneebaum on 11/13/23.
//

import SwiftUI

extension Image {
    @MainActor
    var uiImage: UIImage? {
        ImageRenderer(content: self).uiImage
    }
    
    @MainActor
    func uiImage(resizedTo newSize: CGSize) -> UIImage? {
        let image = resizable()
            .scaledToFill()
            .frame(width: newSize.width, height: newSize.height)
            .clipped()
        return ImageRenderer(content: image).uiImage
    }
}
