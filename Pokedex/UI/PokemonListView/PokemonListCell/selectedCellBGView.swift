//
//  selectedCellBGView.swift
//  Pokedex
//
//  Created by 堺雄之介 on 2019/12/28.
//  Copyright © 2019 Yunosuke Sakai. All rights reserved.
//

import SwiftUI

struct selectedCellBGView: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let w = geometry.size.width
                let h = geometry.size.height
                let p1 = w / 1.60
                let p2 = w / 1.45
                
                path.move(to: CGPoint(x: w - p1, y: 0))
                path.addLine(to: CGPoint(x: w, y: 0))
                path.addLine(to: CGPoint(x: w, y: h))
                path.addLine(to: CGPoint(x: w - p2, y: h))
            }
            .fill(Color(.black))
            .clipShape(RoundedRectangle(cornerRadius: 25))
        }
    }
}
