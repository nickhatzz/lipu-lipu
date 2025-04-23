//
//  ConfettiView.swift
//  lipu lipu
//
//  Created by HPro2 on 4/23/25.
//

import SwiftUI

struct ConfettiView: View {
    var count: Int = 100
    @State var yPosition: CGFloat = 0
    
    var body: some View {
        ZStack {
            ForEach(0..<count, id: \.self) { _ in
                ConfettiPieceView()
                    .position(
                        x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                        y: yPosition != 0 ? CGFloat.random(in: 0...UIScreen.main.bounds.height) : yPosition
                    )
            }
            .ignoresSafeArea()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .onAppear {
                yPosition = CGFloat.random(in: 0...UIScreen.main.bounds.height)
            }
        }
    }
}

#Preview {
    ConfettiView()
}
