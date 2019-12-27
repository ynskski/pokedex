//
//  PokemonListCell.swift
//  Pokedex
//
//  Created by 堺雄之介 on 2019/12/28.
//  Copyright © 2019 Yunosuke Sakai. All rights reserved.
//

import SwiftUI

struct PokemonListCell: View {
    var pokemon: Pokemon
    
    var body: some View {
        HStack {
            pokemon.image
                .resizable()
                .frame(width: 100, height: 100)
            
            VStack(alignment: .leading) {
                Text(String(format: "No. %03d", pokemon.id))
                
                Text(pokemon.name)
                    .font(.headline)
            }
        }
    }
}
