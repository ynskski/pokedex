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
    
    @Binding var selectedPokemonId: Int?
    
    var body: some View {
        VStack {
            if selectedPokemonId == pokemon.id {
                PokemonListSelectedCell(pokemon: pokemon)
            } else {
                PokemonListNormalCell(pokemon: pokemon)
            }
        }
        .padding([.leading, .trailing, .top])
    }
}
