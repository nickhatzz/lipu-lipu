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
    
    @State var isFlipped: Bool = false
    
    struct CardFront: View {
        let word: Word
        @State var color: Color
        
        var body: some View {
            ZStack {
                RoundedRectangle(cornerSize: CGSize(width: 40, height: 40))
                    .frame(width: 390, height: 615)
                    .foregroundStyle(.white)
                
                RoundedRectangle(cornerSize: CGSize(width: 30, height: 30))
                    .frame(width: 375, height: 600)
                    .foregroundStyle(color)
                
                Text(word.word)
                    .fontWeight(.black)
                    .fontWidth(Font.Width(1))
                    .font(.largeTitle)
                
                Text("Tap to flip card.")
                    .offset(y: 250)
            }
        }
    }
    
    struct CardBack: View {
        let word: Word
        let color: Color
        let type: String
        
        var body: some View {
            ZStack {
                RoundedRectangle(cornerSize: CGSize(width: 40, height: 40))
                    .frame(width: 390, height: 615)
                    .foregroundStyle(.white)
                
                RoundedRectangle(cornerSize: CGSize(width: 30, height: 30))
                    .frame(width: 375, height: 600)
                    .foregroundStyle(color)
                
                if type == "vocab" {
                    Text("-" + word.translations["en"]!.definition.replacingOccurrences(of: "; ", with: "\n-"))
                        .fontWeight(.black)
                        .fontWidth(Font.Width(1))
                        .font(.title2)
                        .frame(width: 360, height: 600)
                } else {
                    Text(word.word)
                        .fontWeight(.black)
                        .fontWidth(Font.Width(1))
                        .font(Font.custom("sitelenselikiwenmonoasuki", size: 80))
                }
                
                Text("Left: Didn't get it\nRight: Got it")
                    .offset(y: 250)
            }
        }
    }
    
    var body: some View {
        ZStack {
            CardFront(word: word, color: color)
            if isFlipped {
                CardBack(word: word, color: color, type: type)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .animation(.default, value: true)
            }
        }
        .onTapGesture {
            isFlipped.toggle()
        }
        .rotation3DEffect(.degrees(isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
        .animation(.default, value: isFlipped)
    }
}

#Preview {
    let translations = [
        "en": Translations(commentary: "commentary", definition: "flat and bendable object, e.g. paper, card, leaf; written text or document, e.g. book, website, clay tablet", etymology: [TranslationsEtymology(definition: "definition", language: "language")], sp_etymology: "sitelen etymology")
    ]
    CardView(word: Word(word: "lipu", book: "pu", source_language: "Finnish", usage_category: "core", etymology: [Etymology(word: "word")], translations: translations), color: .accent, type: "vocab")
}
