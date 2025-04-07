//
//  DeckView.swift
//  lipu lipu
//
//  Created by HPro2 on 4/3/25.
//

import SwiftUI

struct DeckView: View {
    let title: String
    let type: String
    let words: [String: Word]
    
    let colors: [Color] = [.accent, .red, .orange, .yellow, .green, .cyan, .blue, .purple, .pink, .indigo, .mint, .teal].shuffled()
    @State var colorIndex: Int = 0
    
    @State var wordKeys: [String] = []
    @State var wordIndex: Int = 0
    
    struct cardFront: View {
        let word: Word
        let color: Color
        
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
    
    struct cardBack: View {
        var body: some View {
            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
        }
    }
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 50, weight: .black))
            cardFront(word: words["lipu"]!, color: colors[colorIndex])
        }.onAppear() {
            wordKeys = words.keys.sorted(by: <)
            wordKeys.shuffle()
        }
    }
}

#Preview {
    let translations = [
        "en": Translations(commentary: "commentary", definition: "flat and bendable object, e.g. paper, card, leaf; written text or document, e.g. book, website, clay tablet", etymology: [TranslationsEtymology(definition: "definition", language: "language")], sp_etymology: "sitelen etymology")
    ]
    DeckView(title: "Deck Title", type: "vocab", words: ["lipu": Word(word: "lipu", book: "pu", source_language: "Finnish", usage_category: "core", etymology: [Etymology(word: "word")], translations: translations)])
}
