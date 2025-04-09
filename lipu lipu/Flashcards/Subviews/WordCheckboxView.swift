//
//  WordCheckboxView.swift
//  lipu lipu
//
//  Created by HPro2 on 4/9/25.
//

import SwiftUI

struct WordCheckboxView: View {
    let word: Word
    
    @State var isChecked: Bool = false
    
    var body: some View {
        HStack {
            // CHECK
            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
            
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
        .animation(.bouncy, value: isChecked)
        .onTapGesture {
            isChecked.toggle()
        }
    }
}
