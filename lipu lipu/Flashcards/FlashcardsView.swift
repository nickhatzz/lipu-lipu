//
//  FlashcardsView.swift
//  lipu lipu
//
//  Created by HPro2 on 12/19/24.
//

import SwiftUI
import SwiftData

struct FlashcardsView: View {
    @State var words: [String: Word] = [:]
    @Query var customDecks: [CustomDeck]
    
    var body: some View {
        NavigationStack {
            List {
                //: VOCAB
                Section(header: SectionHeader(title: "Vocabulary")) {
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 30) {
                            DeckPreview(title: "Common", type: "vocab", words: commonWords, colors: [.red, .orange, .yellow], isCustom: false)
                            DeckPreview(title: "Pu", type: "vocab", words: puWords, colors: [.cyan, .blue, .purple], isCustom: false)
                            DeckPreview(title: "Ku", type: "vocab", words: kuWords, colors: [.green, .mint, .indigo], isCustom: false)
                            DeckPreview(title: "All", type: "vocab", words: words, colors: [.brown, .gray, .black], isCustom: false)
                        }
                        .padding(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5))
                    }
                }
                
                //: SITELEN
                Section(header: SectionHeader(title: "Sitelen Pona")) {
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 30) {
                            DeckPreview(title: "Common", type: "sitelen", words: commonWords, colors: [.pink, .teal, .indigo], isCustom: false)
                            DeckPreview(title: "All", type: "sitelen", words: words, colors: [.purple, .mint, .orange], isCustom: false)
                        }
                        .padding(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5))
                    }
                }
                
                //: CUSTOM
                Section(header: SectionHeader(title: "Custom Decks")) {
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 30) {
                            ForEach(customDecks, id: \.self) { deck in
                                DeckPreview(title: deck.title, type: deck.type, words: deck.words, colors: getRandomColors(title: deck.title), isCustom: true)
                            }
                        }
                        .padding(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5))
                    }
                }
            }
            .listStyle(.inset)
            .navigationTitle("Flashcards")
            .toolbar {
                NavigationLink(destination: DeckCreationView()) {
                    Image(systemName: "plus.square.dashed")
                }
            }
            .onAppear {
                apiCall().getWords { (words) in
                    self.words = words
                }
            }
        }
    }
    
    func getRandomColors(title: String) -> [Color] {
        let possibleColors: [Color] = [.red, .orange, .yellow, .green, .cyan, .blue, .purple, .indigo, .mint, .teal, .black, .brown, .gray, .pink]
        srand48(title.hash)
        
        var randomColors: [Color] = []

        for _ in 0...2 {
            let index = Int(drand48() * Double(possibleColors.count - 1))
            randomColors.append(possibleColors[index])
        }
        
        return randomColors
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
