//
//  WordPreview.swift
//  lipu lipu
//
//  Created by HPro2 on 1/9/25.
//

import SwiftUI

struct WordPreview: View {
    @Environment(\.colorScheme) var colorScheme
    let word: Word
    let book: String
    
    init(word: Word) {
        self.word = word
        
        if word.book == "ku suli" || word.book == "ku lili" {
            book = "ku"
        } else if word.book == "none" {
            book = "kulupu"
        } else {
            book = word.book
        }
    }
    
    var body: some View {
        HStack {
            Text(word.word)
                .frame(width: 75, height: 75, alignment: .center)
                .scaledToFill()
                .font(Font.custom("sitelenselikiwenmonoasuki", size: 80))
            
            VStack(alignment: .leading) {
                HStack {
                    Text(word.word)
                        .font(.headline)
                    Text(book)
                        .frame(width: 25, height: 25, alignment: .center)
                        .scaledToFill()
                        .font(Font.custom("sitelenselikiwenmonoasuki", size: 30))
                }
                Text(word.translations["en"]!.definition)
                    .font(.subheadline)
            }
            .padding(.leading, 5)
            
            Spacer()
        }
    }
}
