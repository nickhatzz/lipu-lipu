//
//  WordView.swift
//  lipu lipu
//
//  Created by HPro2 on 1/9/25.
//

import SwiftUI

struct WordView: View {
    let word: Word
    
    var definitions: [String] = []
    var book: String
    
    init(word: Word) {
        self.word = word
        
        definitions = word.translations["en"]!.definition.components(separatedBy: .init(charactersIn: ";"))
        if word.book == "ku suli" || word.book == "ku lili" {
            book = "ku"
        } else if word.book == "none" {
            book = "kulupu"
        } else {
            book = word.book
        }
    }
    
    var body: some View {
        NavigationStack {
            HStack {
                Text(word.word)
                    .frame(width: 75, height: 75, alignment: .center)
                    .scaledToFill()
                    .font(Font.custom("sitelenselikiwenmonoasuki", size: 80))
                
                VStack(alignment: .leading) {
                    Text(word.word)
                        .font(.title)
                    HStack {
                        Text("from: \(book)")
                            .font(.subheadline)
                        Text(book)
                            .frame(width: 25, height: 25, alignment: .center)
                            .scaledToFill()
                            .font(Font.custom("sitelenselikiwenmonoasuki", size: 30))
                    }
                }
                .padding(.leading, 5)
                
                Spacer()
            }
            .padding(.leading, 5)
            List {
                //: DEFINITIONS
                Section(header: Text("Definitions")) {
                    ForEach(definitions, id: \.self) { definition in
                        Text(definition)
                    }
                }
                
                //: COMMENTARY
                if !word.translations["en"]!.commentary.isEmpty {
                    Section {
                        Text(word.translations["en"]!.commentary)
                    }
                }
                
                //: ETYMOLOGY
                Section(header: Text("Etymology")) {
                    if (word.translations["en"]!.etymology[0].definition != nil) {
                        Text("\(word.translations["en"]!.etymology[0].language) • \(word.etymology[0].word!):  \(word.translations["en"]!.etymology[0].definition!)")
                    } else {
                        Text(word.translations["en"]!.etymology[0].language)
                    }
                    if !word.translations["en"]!.sp_etymology.isEmpty {
                        Text("Sitelen Pona: \(word.translations["en"]!.sp_etymology)")
                    }
                }
                
                //: RESOURCES
                Section(header: Text("Resources")) {
                    HStack {
                        Link(destination: URL(string: "https://nimi.li/\(word.word)")!) {
                            Text("Open in nimi.li")
                        }
                        Spacer()
                        Image(systemName: "safari")
                            .foregroundStyle(.tertiary)
                    }
                    HStack {
                        Link(destination: URL(string: "https://linku.la/words/\(word.word)")!) {
                            Text("Open in linku.la")
                        }
                        Spacer()
                        Image(systemName: "safari")
                            .foregroundStyle(.tertiary)
                    }
                }
            }
            .listSectionSpacing(10)
            Spacer()
        }
        
    }
}

#Preview {
    let translations = [
        "en": Translations(commentary: "commentary", definition: "flat and bendable object, e.g. paper, card, leaf; written text or document, e.g. book, website, clay tablet", etymology: [TranslationsEtymology(definition: "definition", language: "language")], sp_etymology: "sitelen etymology")
    ]
    WordView(word: Word(word: "lipu", book: "pu", source_language: "Finnish", usage_category: "core", etymology: [Etymology(word: "word")], translations: translations))
}
