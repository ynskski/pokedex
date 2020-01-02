//
//  PokemonListView.swift
//  Pokedex
//
//  Created by 堺雄之介 on 2019/12/28.
//  Copyright © 2019 Yunosuke Sakai. All rights reserved.
//

import SwiftUI

struct PokemonListView: View {
    @State private var selectedPokemonId: Int? = nil
    @State private var searchText = ""
    
    var body: some View {
        ScrollView {
            VStack {
                SearchBar(text: $searchText)
                
                ForEach(pokemonData.filter {
                    self.searchText.isEmpty ? true :
                        $0.name.localizedCaseInsensitiveContains(self.searchText)
                }) { pokemon in
                    PokemonListCell(pokemon: pokemon, selectedPokemonId: self.$selectedPokemonId)
                        .onTapGesture {
                            if self.selectedPokemonId == nil || self.selectedPokemonId != pokemon.id{
                                self.selectedPokemonId = pokemon.id
                            } else {
                                self.selectedPokemonId = nil
                            }
                    }
                }
            }
        }
    }
}
