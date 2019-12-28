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
        NavigationView {
            PokemonListView()
                .navigationBarTitle(Text("ポケモン図鑑"), displayMode: .inline)
                .background(NavigationConfigurator { nc in
                    nc.navigationBar.barTintColor = UIColor(red: 221/255, green: 91/255, blue: 68/255, alpha: 1.0)
                    nc.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
                })
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
