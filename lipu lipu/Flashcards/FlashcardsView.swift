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
    
    struct SectionHeader: View {
        var title: String
        
        var body: some View {
            Text(title)
                .font(.title2)
                .textCase(nil)
                .fontWeight(.bold)
                .foregroundStyle(.foreground)
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                //: VOCAB
                Section(header: SectionHeader(title: "Vocabulary")) {
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
                Section(header: SectionHeader(title: "Sitelen Pona")) {
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 30) {
                            DeckPreview(title: "Common", type: "sitelen", words: commonWords, colors: [.pink, .teal, .indigo])
                            DeckPreview(title: "All", type: "sitelen", words: words, colors: [.purple, .mint, .orange])
                        }
                        .padding(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5))
                    }
                }
                
                //: CUSTOM
                Section(header: SectionHeader(title: "Custom Decks")) {
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 30) {
                            ForEach(customDecks, id: \.self) { deck in
                                DeckPreview(title: deck.title, type: deck.type, words: deck.words, colors: colorsFromTitle(deck.title))
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
    
    func colorsFromTitle(_ title: String) -> [Color] {
        let possibleColors: [Color] = [.red, .orange, .yellow, .green, .cyan, .blue, .purple, .indigo, .mint, .teal]
        
        var colors: [Color]
        let titleInt: Int = stringToInt(title)
        let titleIntArray = String(describing: titleInt).compactMap { Int(String($0)) }
        
        guard String(describing: titleInt).count > 2 else { return [.red, .orange, .green] }
        
        colors = [possibleColors[titleIntArray[0]], possibleColors[titleIntArray[1]], possibleColors[titleIntArray[2]]]
        
        return colors
    }
    
    func stringToInt(_ string: String) -> Int {
        var intString = ""
        
        for letter in string {
            switch letter {
            case "a":
                intString.append("0")
            case "b":
                intString.append("1")
            case "c":
                intString.append("2")
            case "d":
                intString.append("3")
            case "e":
                intString.append("4")
            case "f":
                intString.append("5")
            case "g":
                intString.append("6")
            case "h":
                intString.append("7")
            case "i":
                intString.append("8")
            case "j":
                intString.append("9")
            case "k":
                intString.append("0")
            case "l":
                intString.append("1")
            case "m":
                intString.append("2")
            case "n":
                intString.append("3")
            case "o":
                intString.append("4")
            case "p":
                intString.append("5")
            case "q":
                intString.append("6")
            case "r":
                intString.append("7")
            case "s":
                intString.append("8")
            case "t":
                intString.append("9")
            case "u":
                intString.append("0")
            case "v":
                intString.append("1")
            case "w":
                intString.append("2")
            case "x":
                intString.append("3")
            case "y":
                intString.append("4")
            case "z":
                intString.append("5")
            default:
                intString.append("0")
            }
        }
        
        return Int(intString) ?? 567
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
