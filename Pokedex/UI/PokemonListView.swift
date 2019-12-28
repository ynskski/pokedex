//
//  PokemonListView.swift
//  Pokedex
//
//  Created by 堺雄之介 on 2019/12/28.
//  Copyright © 2019 Yunosuke Sakai. All rights reserved.
//

import SwiftUI

struct PokemonListView: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(pokemonData) { pokemon in
                    PokemonListCell(pokemon: pokemon)
                }
            }
        }
    }
}
