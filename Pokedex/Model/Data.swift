//
//  Data.swift
//  Pokedex
//
//  Created by 堺雄之介 on 2019/12/27.
//  Copyright © 2019 Yunosuke Sakai. All rights reserved.
//

import Foundation
import SwiftUI

let path = "pokedex.json"
let pokemonData: [Pokemon] = load(path)

func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

final class ImageStore {
    typealias _ImageDictionary = [String: CGImage]
    fileprivate var images: _ImageDictionary = [:]
    fileprivate static var scale = 2
    static var shared = ImageStore()
    
    static func loadImage(name: String) -> CGImage {
        guard
            let url = Bundle.main.url(forResource: name, withExtension: "png"),
            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
        else {
            fatalError("Coudln't load image \(name).png from main bundle")
        }
        
        return image
    }
    
    fileprivate func _guaranteeImage(name: String) -> _ImageDictionary.Index {
        if let index = images.index(forKey: name) {
            return index
        }
        
        images[name] = ImageStore.loadImage(name: name)
        return images.index(forKey: name)!
    }
    
    func image(name: String) -> Image {
        let index = _guaranteeImage(name: name)
        return Image(images.values[index],
                     scale: CGFloat(ImageStore.scale),
                     label: Text(verbatim: name))
    }
}
