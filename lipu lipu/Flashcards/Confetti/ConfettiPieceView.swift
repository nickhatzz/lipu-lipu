//
//  ConfettiPieceView.swift
//  lipu lipu
//
//  Created by HPro2 on 4/23/25.
//

import SwiftUI

struct ConfettiPieceView: View {
    @State var animated = false
    @State var xSpeed = Double.random(in: 0.6...3)
    @State var zSpeed = Double.random(in: 1...2)
    @State var anchor = CGFloat.random(in: 0...1).rounded()
    
    var fillColor: Color = [Color.pink, Color.green, Color.blue, Color.yellow].randomElement()!
    
    var body: some View {
        Rectangle()
            .fill(fillColor)
            .frame(width: 30, height: 15)
            .rotation3DEffect(.degrees(animated ? 360 : 0), axis: (x: 1, y: 0, z: 0))
            .animation(Animation.linear(duration: xSpeed).repeatForever(autoreverses: false), value: animated)
            .rotation3DEffect(.degrees(animated ? 360 : 0), axis: (x: 0, y: 0, z: 1), anchor: UnitPoint(x: anchor, y: anchor))
            .animation(Animation.linear(duration: zSpeed).repeatForever(autoreverses: false), value: animated)
            .onAppear {
                animated = true
            }
    }
}

#Preview {
    ConfettiPieceView()
}
