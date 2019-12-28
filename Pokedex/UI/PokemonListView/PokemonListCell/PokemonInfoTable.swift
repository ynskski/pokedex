//
//  PokemonInfoTable.swift
//  Pokedex
//
//  Created by 堺雄之介 on 2019/12/28.
//  Copyright © 2019 Yunosuke Sakai. All rights reserved.
//

import SwiftUI

struct PokemonInfoTable: View {
    var pokemon: Pokemon
    
    var body: some View {
        VStack {
            pokemon.image
                .resizable()
                .frame(width: 100, height: 100)
            
            HStack {
                ForEach(pokemon.type, id: \.self) { type in
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(type.color)
                        
                        Text(type.title)
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}
