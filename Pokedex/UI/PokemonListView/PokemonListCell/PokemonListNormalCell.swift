//
//  PokemonListNormalCell.swift
//  Pokedex
//
//  Created by 堺雄之介 on 2019/12/28.
//  Copyright © 2019 Yunosuke Sakai. All rights reserved.
//

import SwiftUI

struct PokemonListNormalCell: View {
    var pokemon: Pokemon
    
    var body: some View {
        HStack {
            pokemon.spriteImage
                .resizable()
                .frame(width: 50, height: 50)
            
            Text(String(format: "No. %03d", pokemon.id))
            
            Text(pokemon.name)
                .font(.headline)
                .padding([.leading])
            
            Spacer()
        }
    }
}
