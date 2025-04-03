//
//  DeckPreview.swift
//  lipu lipu
//
//  Created by HPro2 on 4/3/25.
//

import SwiftUI

struct DeckPreview: View {
    let title: String
    let sampleWords: [String]
    let colors: [Color]
    
    var body: some View {
        VStack {
            Text(title)
                .textCase(.uppercase)
                .font(.caption)
                .fontWeight(.black)
                .fontWidth(Font.Width(1))
                .frame(width: 140, height: 40)
            ZStack {
                card(text: sampleWords[0], color: colors[0])
                    .rotationEffect(Angle(degrees: -10))
                    .offset(x: -30)
                card(text: sampleWords[1], color: colors[1])
                    .rotationEffect(Angle(degrees: 0))
                card(text: sampleWords[2], color: colors[2])
                    .rotationEffect(Angle(degrees: 10))
                    .offset(x: 30, y: 5)
            }
        }
    }
    
    struct card: View {
        let text: String
        let color: Color
        
        var body: some View {
            ZStack {
                RoundedRectangle(cornerSize: CGSize(width: 12, height: 12))
                    .frame(width: 55, height: 75)
                    .rotationEffect(Angle(degrees: 0))
                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                    .frame(width: 50, height: 70)
                    .rotationEffect(Angle(degrees: 0))
                    .foregroundStyle(color)
                Text(text)
                    .foregroundStyle(.white)
                    .frame(width: 45, height: 75)
                    .font(Font.custom("sitelenselikiwenmonoasuki", size: 50))
            }
        }
    }
}

#Preview {
    DeckPreview(title: "Sample Deck", sampleWords: ["toki", "lipu", "kijetesantakalu"], colors: [.red, .orange, .yellow])
}
