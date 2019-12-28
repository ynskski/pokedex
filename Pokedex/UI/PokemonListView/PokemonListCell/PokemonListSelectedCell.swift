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
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .shadow(color: .gray, radius: 5, x: 0, y: 5)

                PokemonListNormalCell(pokemon: pokemon)
                    .background(selectedCellBGView())
            }
            .foregroundColor(.white)
            
            PokemonInfoTable(pokemon: pokemon)
        }
    }
}
