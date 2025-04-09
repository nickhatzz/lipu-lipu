//
//  CardView.swift
//  lipu lipu
//
//  Created by HPro2 on 4/8/25.
//

import SwiftUI

struct CardView: View {
    let word: Word
    let color: Color
    let type: String
    let isFlipped: Bool
    
//    @State var isFlipped: Bool = false
    
    struct CardFront: View {
        let word: Word
        let color: Color
        let type: String
        
        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 50)
                    .aspectRatio(0.64, contentMode: .fit)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    .foregroundStyle(.white)
                
                RoundedRectangle(cornerRadius: 40)
                    .aspectRatio(0.62, contentMode: .fit)
                    .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                    .foregroundStyle(color)
                
                if type == "vocab" {
                    Text(word.word)
                        .fontWeight(.black)
                        .fontWidth(Font.Width(1))
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                } else {
                    Text(word.word)
                        .fontWeight(.black)
                        .fontWidth(Font.Width(1))
                        .font(Font.custom("sitelenselikiwenmonoasuki", size: 200))
                        .foregroundStyle(.white)
                }
                
                VStack {
                    Spacer()
                    Text("Tap to flip card.")
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 55, trailing: 0))
                        .foregroundStyle(.white)
                }
            }
            .aspectRatio(0.64, contentMode: .fit)
        }
    }
    
    struct CardBack: View {
        let word: Word
        let color: Color
        let type: String
        
        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 50)
                    .aspectRatio(0.64, contentMode: .fit)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    .foregroundStyle(.white)
                
                RoundedRectangle(cornerRadius: 40)
                    .aspectRatio(0.62, contentMode: .fit)
                    .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                    .foregroundStyle(color)
                
                if type == "vocab" {
                    Text("-" + word.translations["en"]!.definition.replacingOccurrences(of: "; ", with: "\n-"))
                        .fontWeight(.black)
                        .fontWidth(Font.Width(1))
                        .font(.title2)
                        .aspectRatio(0.5, contentMode: .fit)
                        .foregroundStyle(.white)
                } else {
                    Text(word.word)
                        .fontWeight(.black)
                        .fontWidth(Font.Width(1))
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                }
                
                VStack {
                    Spacer()
                    Text("Swipe left or right")
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 55, trailing: 0))
                        .foregroundStyle(.white)
                }
            }
            .aspectRatio(0.64, contentMode: .fit)
        }
    }
    
    var body: some View {
        ZStack {
            if isFlipped {
                CardBack(word: word, color: color, type: type)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .animation(.default, value: true)
            } else {
                CardFront(word: word, color: color, type: type)
            }
        }
        .rotation3DEffect(.degrees(isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
        .animation(.bouncy)
    }
}
