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
            ZStack {
                if selectedPokemonId == pokemon.id {
                    Color(red: 229/255, green: 119/255, blue: 84/255)
                }
                
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
            
            if selectedPokemonId == pokemon.id {
                pokemon.image
                    .resizable()
                    .frame(width: 100, height: 100)
            }
        }
        .padding([.leading, .trailing, .top])
    }
}
