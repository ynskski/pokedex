//
//  ContentView.swift
//  Pokedex
//
//  Created by 堺雄之介 on 2019/12/27.
//  Copyright © 2019 Yunosuke Sakai. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.orange)
                .edgesIgnoringSafeArea(.all)
            
            NavigationView {
                PokemonListView()
                    .navigationBarTitle(Text("ポケモン図鑑"), displayMode: .large)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
