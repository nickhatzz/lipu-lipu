//
//  WordPreviewCellView.swift
//  lipu lipu
//
//  Created by HPro2 on 1/9/25.
//

import SwiftUI

struct WordPreviewCellView: View {
    @Environment(\.colorScheme) var colorScheme
    let word: String
    let translations: String
    let source: String
    var sourceToki: String
    
    init(word: String, translations: String, source: String) {
        self.word = word
        self.translations = translations
        self.source = source
        sourceToki = source
        
        if source == "community" {
            sourceToki = "kulupu"
        }
    }
    
    var body: some View {
        HStack {
            Text(word)
                .frame(width: 75, height: 75, alignment: .center)
                .scaledToFill()
                .font(Font.custom("sitelenselikiwenmonoasuki", size: 80))
            
            VStack(alignment: .leading) {
                HStack {
                    Text(word)
                        .font(.headline)
                    Text(sourceToki)
                        .frame(width: 25, height: 25, alignment: .center)
                        .scaledToFill()
                        .font(Font.custom("sitelenselikiwenmonoasuki", size: 30))
                }
                Text(translations)
                    .font(.subheadline)
            }
            .padding(.leading, 5)
            
            Spacer()
        }
    }
}
