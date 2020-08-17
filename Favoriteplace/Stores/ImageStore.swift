//
//  ImageStore.swift
//  Favoriteplace
//
//  Created by Mustafa Khalil on 8/17/20.
//

import SwiftUI

final class ImageStore {
    typealias _ImagesCache = [String: CGImage]
    private var cache: _ImagesCache = [:]
    private var scale: CGFloat = 3
    
    static var shared = ImageStore()
    
    func retrieve(image: String) -> Image {
        let index = _guaranteeImage(named: image)
        return Image(cache.values[index], scale: scale, label: Text(image))
    }
    
    fileprivate func _guaranteeImage(named name: String) -> _ImagesCache.Index {
        if let index = cache.index(forKey: name) { return index }
        cache[name] = load(image: name)
        return cache.index(forKey: name)!
    }
    
    fileprivate func load(image: String) -> CGImage {
        
        guard let url = Bundle.main.url(forResource: image, withExtension: "jpg"),
              let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
              let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
        else {
            fatalError("Couldnt load data.mon")
        }
        return image
    }
}
