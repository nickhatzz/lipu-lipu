//
//  WordView.swift
//  lipu lipu
//
//  Created by HPro2 on 1/9/25.
//

import SwiftUI

struct WordView: View {
    let word: String
    let translations: String
    let source: String
    
    var translationsArray: [String] = []
    var sourceToki: String
    
    init(word: String, translations: String, source: String) {
        self.word = word
        self.translations = translations
        self.source = source
        sourceToki = source
        
        translationsArray = translations.components(separatedBy: "; ")
        if source == "community" {
            sourceToki = "kulupu"
        }
    }
    
    var body: some View {
        NavigationStack {
            HStack {
                Text(word)
                    .frame(width: 75, height: 75, alignment: .center)
                    .scaledToFill()
                    .font(Font.custom("sitelenselikiwenmonoasuki", size: 80))
                
                VStack(alignment: .leading) {
                    Text(word)
                        .font(.title)
                    HStack {
                        Text("from: \(source)")
                            .font(.subheadline)
                        Text(sourceToki)
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
                Section(header: Text("Definitions")) {
                    ForEach(translationsArray, id: \.self) { definition in
                        Text(definition)
                    }
                }
                Section(header: Text("Resources")) {
                    HStack {
                        Link(destination: URL(string: "https://nimi.li/\(word)")!) {
                            Text("Open in nimi.li")
                        }
                        Spacer()
                        Image(systemName: "safari")
                            .foregroundStyle(.tertiary)
                    }
                    HStack {
                        Link(destination: URL(string: "https://linku.la/words/\(word)")!) {
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
    WordView(word: "a", translations: "(interjection) ah, oh, ha, eh, um, oy; (particle) [placed after something for emphasis or emotion]", source: "pu")
}
