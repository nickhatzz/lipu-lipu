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
    
    @State var xOffset: CGFloat = 0
    @State var direction: String = "middle"
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 50, weight: .black))
            CardView(word: words["lipu"]!, color: colors[colorIndex], type: type)
                .offset(x: xOffset)
                .animation(.interactiveSpring)
                .gesture(DragGesture(minimumDistance: 0)
                    .onChanged({ value in
                        xOffset = value.translation.width
                        if value.translation.width < -20 {
                            direction = "left"
                        }
                        if value.translation.width > 20 {
                            direction = "right"
                        }
                    })
                    .onEnded({ value in
                        if value.translation.width < -20 {
                            direction = "left"
                        }
                        if value.translation.width > 20 {
                            direction = "right"
                        }
                        xOffset = 0
                    })
                )
            
            if direction == "left" {
                Text("👎")
            }
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
