//
//  DeckPreview.swift
//  lipu lipu
//
//  Created by HPro2 on 4/3/25.
//

import SwiftUI

struct DeckPreview: View {
    let title: String
    let type: String
    let words: [String: Word]
    let colors: [Color]
    let isCustom: Bool
    
    var body: some View {
        NavigationLink(destination: DeckView(title: title, type: type, words: words, isCustom: isCustom)) {
            VStack {
                Text(title)
                    .textCase(.uppercase)
                    .font(.caption)
                    .fontWeight(.black)
                    .fontWidth(Font.Width(1))
                    .frame(width: 140)
                ZStack {
                    card(text: words.keys.sorted(by: >).randomElement() ?? "pakala", color: colors[0])
                        .rotationEffect(Angle(degrees: -10))
                        .offset(x: -30)
                    card(text: words.keys.sorted(by: >).randomElement() ?? "pakala", color: colors[1])
                        .rotationEffect(Angle(degrees: 0))
                    card(text: words.keys.sorted(by: >).randomElement() ?? "pakala", color: colors[2])
                        .rotationEffect(Angle(degrees: 10))
                        .offset(x: 30, y: 5)
                }
            }
            .overlay {
                RoundedRectangle(cornerRadius: 10, style: .circular).stroke(Color(UIColor.tertiaryLabel), lineWidth: 2)
                    .frame(width: 145, height: 120)
            }
        }
        .buttonStyle(PlainButtonStyle())
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
