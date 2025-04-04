//
//  FlashcardsView.swift
//  lipu lipu
//
//  Created by HPro2 on 12/19/24.
//

import SwiftUI

struct FlashcardsView: View {
    @State var words: [String: Word] = [:]
    
    var body: some View {
        NavigationStack {
            List {
                
                //: VOCAB
                Section("Vocabulary") {
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 30) {
                            DeckPreview(title: "Common", type: "vocab", words: commonWords, colors: [.red, .orange, .yellow])
                            DeckPreview(title: "Pu", type: "vocab", words: puWords, colors: [.cyan, .blue, .purple])
                            DeckPreview(title: "Ku", type: "vocab", words: kuWords, colors: [.green, .mint, .indigo])
                            DeckPreview(title: "All", type: "vocab", words: words, colors: [.brown, .gray, .black])
                        }
                        .padding(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5))
                    }
                }
                
                //: SITELEN
                Section("Sitelen Pona") {
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 30) {
                            DeckPreview(title: "Common", type: "sitelen", words: commonWords, colors: [.pink, .teal, .indigo])
                            DeckPreview(title: "All", type: "sitelen", words: words, colors: [.purple, .mint, .orange])
                        }
                        .padding(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5))
                    }
                }
                
                //: CUSTOM
                Section("Custom Decks") {
                    
                }
            }
            .listStyle(.inset)
            .navigationTitle("Flashcards")
            .onAppear {
                apiCall().getWords { (words) in
                    self.words = words
                }
            }
        }
    }
    
    //: WORD LISTS
    var puWords: [String: Word] {
        let wordKeys = words.keys.sorted(by: <)
        let filteredKeys = wordKeys.filter { key in
            words[key]!.book == "pu" && words[key]!.usage_category != "obscure"
        }
        var filteredWords: [String: Word] = [:]
        for key in filteredKeys {
            filteredWords[key] = words[key]!
        }
        return filteredWords
    }
    
    var kuWords: [String: Word] {
        let wordKeys = words.keys.sorted(by: <)
        let filteredKeys = wordKeys.filter { key in
            words[key]!.book == "ku suli" || words[key]!.book == "ku lili" && words[key]!.usage_category != "obscure"
        }
        var filteredWords: [String: Word] = [:]
        for key in filteredKeys {
            filteredWords[key] = words[key]!
        }
        return filteredWords
    }
    
    var commonWords: [String: Word] {
        let wordKeys = words.keys.sorted(by: <)
        let filteredKeys = wordKeys.filter { key in
            words[key]!.usage_category != "obscure"
        }
        var filteredWords: [String: Word] = [:]
        for key in filteredKeys {
            filteredWords[key] = words[key]!
        }
        return filteredWords
    }
}

#Preview {
    FlashcardsView()
}
