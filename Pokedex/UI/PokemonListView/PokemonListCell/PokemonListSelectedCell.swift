//
//  PokemonListSelectedCell.swift
//  Pokedex
//
//  Created by 堺雄之介 on 2019/12/28.
//  Copyright © 2019 Yunosuke Sakai. All rights reserved.
//

import SwiftUI

struct PokemonListSelectedCell: View {
    var pokemon: Pokemon
    
    var body: some View {
        VStack {
            ZStack {
                Color(red: 221/255, green: 91/255, blue: 68/255)
                
                PokemonListNormalCell(pokemon: pokemon)
            }
            .foregroundColor(.white)
            
            pokemon.image
                .resizable()
                .frame(width: 100, height: 100)
        }
    }
}
