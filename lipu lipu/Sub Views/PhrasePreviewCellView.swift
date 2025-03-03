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
        
    var translationsText: String = ""
    var translationsSitelen: String = ""
    
    init(phrase: String, translations: String) {
        self.phrase = phrase
        self.translations = translations
        
        translationsText = translations.components(separatedBy: "; ")[0]
        
        translationsSitelen = translations.components(separatedBy: "; ")[0]
        translationsSitelen = translationsSitelen.replacingOccurrences(of: "!", with: "")
        translationsSitelen = translationsSitelen.replacingOccurrences(of: "?", with: "")
        
        if translations.contains("; ") {
            translationsText.append("...")
        }
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(phrase)
                    .font(.title)
                    .bold()
                Spacer()
                Text(translationsText)
                    .font(.title2)
                    .foregroundStyle(.secondary)
                Spacer()
                Text(translationsSitelen)
                    .scaledToFill()
                    .font(Font.custom("sitelenselikiwenmonoasuki", size: 24))
                    .foregroundStyle(.tertiary)
            }
            .padding(.leading, 5)
        }
    }
}

#Preview {
    PhrasePreviewCellView(phrase: "\"lipu lipu\" is a Toki Pona app", translations: "ilo [lipu lipu] li ilo pi toki-pona; test!; test")
}
