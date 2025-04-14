//
//  PhraseView.swift
//  lipu lipu
//
//  Created by HPro2 on 3/3/25.
//

import SwiftUI

struct PhraseView: View {
    @Environment(\.colorScheme) var colorScheme
    let phrase: String
    let translations: String
    let translationsArray: [String]
    
    init(phrase: String, translations: String) {
        self.phrase = phrase
        self.translations = translations
        
        translationsArray = translations.components(separatedBy: "; ")
    }
    
    var body: some View {
        Text(phrase)
            .font(.title)
            .bold()
        
        List {
            //: TRANSLATIONS
            Section(header: Text("Translations")) {
                ForEach(translationsArray, id: \.self) { translation in
                    VStack(alignment: .leading) {
                        Text(translation)
                        Text(translation.replacingOccurrences(of: "!", with: "").replacingOccurrences(of: "?", with: ""))
                            .font(Font.custom("sitelenselikiwenmonoasuki", size: 18))
                            .foregroundStyle(.secondary)
                    }
                }
            }
            
            //: DISCLAIMER
            Section(header: Text("Disclaimer")) {
                Text("Keep in mind that Toki Pona is a flexible language! These are possible ways to say this idea, but they aren't \(Text("the").underline()) way to say it. Get creative and think of your own ways of saying this idea too!")
            }
        }
    }
}

#Preview {
    PhraseView(phrase: "\"lipu lipu\" is a Toki Pona app", translations: "ilo [lipu lipu] li ilo pi toki pona; toki!; lipu lipu")
}
