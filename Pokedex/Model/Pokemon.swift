//
//  Pokemon.swift
//  Pokedex
//
//  Created by 堺雄之介 on 2019/12/27.
//  Copyright © 2019 Yunosuke Sakai. All rights reserved.
//

import Foundation
import SwiftUI

struct Pokemon: Hashable, Decodable, Identifiable {
    var id: Int
    var name: String
    var type: [Type]
    var status: Status
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        
        let name = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .name)
        self.name = try name.decode(String.self, forKey: .japanese)
        
        let types = try container.decode([String].self, forKey: .type)
        self.type = types.map { Type(rawValue: $0) }.compactMap { $0 }
        
        self.status = try container.decode(Status.self, forKey: .base)
    }
    
    enum `Type`: String, CaseIterable {
        case grass = "Grass"
        case poison = "Poison"
        case fire       = "Fire"
        case flying     = "Flying"
        case water      = "Water"
        case bug        = "Bug"
        case normal     = "Normal"
        case electric   = "Electric"
        case ground     = "Ground"
        case fairy      = "Fairy"
        case rock       = "Rock"
        case steel      = "Steel"
        case ghost      = "Ghost"
        case dark       = "Dark"
        case psychic    = "Psychic"
        case dragon     = "Dragon"
        case fighting   = "Fighting"
        case ice        = "Ice"
        
        var title: String {
            switch self {
            case .grass:
                return "くさ"
            case .poison:
                return "どく"
            case .fire:
                return "ほのお"
            case .flying:
                return "ひこう"
            case .water:
                return "みず"
            case .bug:
                return "むし"
            case .normal:
                return "ノーマル"
            case .electric:
                return "でんき"
            case .ground:
                return "じめん"
            case .fairy:
                return "フェアリー"
            case .rock:
                return "いわ"
            case .steel:
                return "はがね"
            case .ghost:
                return "ゴースト"
            case .dark:
                return "あく"
            case .psychic:
                return "エスパー"
            case .dragon:
                return "ドラゴン"
            case .fighting:
                return "かくとう"
            case .ice:
                return "こおり"
            }
        }
        
        var color: Color {
            switch self {
            case .grass:
                return Color(red: 166 / 255, green: 193 / 255, blue: 50 / 255)
            case .poison:
                return Color(red: 157 / 255, green: 121 / 255, blue: 199 / 255)
            case .fire:
                return Color(red: 234 / 255, green: 166 / 255, blue: 106 / 255)
            case .flying:
                return Color(red: 123 / 255, green: 165 / 255, blue: 237 / 255)
            case .water:
                return Color(red: 136 / 255, green: 197 / 255, blue: 245 / 255)
            case .bug:
                return Color(red: 131 / 255, green: 203 / 255, blue: 98 / 255)
            case .normal:
                return Color(red: 173 / 255, green: 173 / 255, blue: 173 / 255)
            case .electric:
                return Color(red: 226 / 255, green: 211 / 255, blue: 51 / 255)
            case .ground:
                return Color(red: 191 / 255, green: 167 / 255, blue: 75 / 255)
            case .fairy:
                return Color(red: 224 / 255, green: 118 / 255, blue: 152 / 255)
            case .rock:
                return Color(red: 237 / 255, green: 198 / 255, blue: 61 / 255)
            case .steel:
                return Color(red: 130 / 255, green: 137 / 255, blue: 163 / 255)
            case .ghost:
                return Color(red: 115 / 255, green: 110 / 255, blue: 176 / 255)
            case .dark:
                return Color(red: 111 / 255, green: 129 / 255, blue: 209 / 255)
            case .psychic:
                return Color(red: 211 / 255, green: 128 / 255, blue: 240 / 255)
            case .dragon:
                return Color(red: 228 / 255, green: 134 / 255, blue: 91 / 255)
            case .fighting:
                return Color(red: 210 / 255, green: 105 / 255, blue: 106 / 255)
            case .ice:
                return Color(red: 151 / 255, green: 231 / 255, blue: 244 / 255)
            }
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case japanese
        case type
        case base
    }
    
    struct Status: Hashable, Codable {
        var hp: Int
        var attack: Int
        var defense: Int
        var spAttack: Int
        var spDefense: Int
        var speed: Int
        
        enum CodingKeys: String, CodingKey {
            case hp = "HP"
            case attack = "Attack"
            case defense = "Defense"
            case spAttack = "Sp. Attack"
            case spDefense = "Sp. Defense"
            case speed = "Speed"
        }
    }
}

extension Pokemon {
    var image: Image {
        return ImageStore.shared.image(name: String(format: "%03d", self.id))
    }
    
    var spriteImage: Image {
        return ImageStore.shared.image(name: String(format: "%03dMS", self.id))
    }
}
