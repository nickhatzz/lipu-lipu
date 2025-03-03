//
//  PhrasePreviewCellView.swift
//  lipu lipu
//
//  Created by HPro2 on 3/3/25.
//

import SwiftUI

struct PhrasePreviewCellView: View {
    @Environment(\.colorScheme) var colorScheme
    let phrase: String
    let translations: String
    
    init(phrase: String, translations: String) {
        self.phrase = phrase
        self.translations = translations
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(phrase)
                        .font(.headline)
                }
                Text(translations)
                    .font(.subheadline)
            }
            .padding(.leading, 5)
            
            Spacer()
            
            Text(translations)
                .frame(width: 150, height: 100, alignment: .center)
                .scaledToFill()
                .font(Font.custom("sitelenselikiwenmonoasuki", size: 28))
        }
    }
}

#Preview {
    PhrasePreviewCellView(phrase: "\"lipu lipu\" is a Toki Pona app", translations: "ilo [lipu lipu] li ilo pi toki-pona")
}
