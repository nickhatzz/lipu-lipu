//
//  VocabPreview.swift
//  lipu lipu
//
//  Created by Nick Hatzidakis on 3/8/25.
//

import SwiftUI

struct VocabPreview: View {
    let word: Word
    
    var body: some View {
        NavigationLink(destination: WordView(word: word)) {
            HStack {
                // WORD
                VStack(alignment: .leading) {
                    Text(word.word)
                    Text(word.word)
                        .font(Font.custom("sitelenselikiwenmonoasuki", size: 18))
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
                // TRANSLATIONS
                Text(word.translations["en"]!.definition)
                    .lineLimit(2)
                    .frame(width: 150, alignment: .leading)
            }
        }
    }
}
