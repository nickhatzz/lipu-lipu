//
//  DeckView.swift
//  lipu lipu
//
//  Created by HPro2 on 4/3/25.
//

import SwiftUI

struct DeckView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.modelContext) var modelContext

    @State var title: String
    let type: String
    let words: [String: Word]
    let isCustom: Bool
    
    @State var colors: [Color] = [.accent, .red, .orange, .yellow, .green, .cyan, .blue, .purple, .pink, .indigo, .mint, .teal].shuffled()
    @State var wordKeys: [String] = []
    
    @State var xOffset: CGFloat = 0
    @State var isFlipped: Bool = false
    @State var shadowColor: Color = .gray
    
    var body: some View {
        ZStack {
            // CONFETTI
            if wordKeys.isEmpty {
                ConfettiView()
            }
            
            // CARDS
            VStack {
                Text(title)
                    .font(.system(size: 50, weight: .black))
                    .animation(.spring, value: wordKeys.isEmpty)
                if !wordKeys.isEmpty {
                    CardView(word: words[wordKeys[0]]!, color: colors[0], type: type, isFlipped: isFlipped)
                        .offset(x: xOffset)
                        .animation(.bouncy, value: xOffset)
                        .shadow(color: shadowColor, radius: 20)
                        .rotationEffect(.degrees(xOffset/40))
                        .onTapGesture {
                            isFlipped.toggle()
                        }
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged({ value in
                                    xOffset = value.translation.width
                                    switch value.translation.width {
                                    case ..<(-20):
                                        // left - incorrect
                                        shadowColor = .red
                                    case 20...:
                                        // right - correct
                                        shadowColor = .green
                                    default:
                                        shadowColor = .gray
                                    }
                                })
                                .onEnded({ value in
                                    switch value.translation.width {
                                    case ..<(-100):
                                        swipeLeft()
                                    case 100...:
                                        swipeRight()
                                    default:
                                        xOffset = 0
                                    }
                                    shadowColor = .gray
                                })
                        )
                } else {
                    Text("You did it!")
                        .animation(.spring, value: wordKeys.isEmpty)
                }
//                Spacer()
            }
        }.onAppear() {
            wordKeys = words.keys.sorted(by: <)
            wordKeys.shuffle()
        }
        .toolbar {
            if isCustom {
                Menu {
                    // EDIT
                    NavigationLink(destination: DeckCreationView(selectedWords: words, titleText: title, typeSelection: type)) {
                        Label("Edit Deck", systemImage: "slider.horizontal.3")
                    }

                    // DELETE
                    Button(role: .destructive) {
                        do {
                            try modelContext.delete(model: CustomDeck.self, where: #Predicate { deck in
                                deck.title == title
                            })
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print("Unable to delete deck")
                        }
                    } label: {
                        Label("Delete Deck", systemImage: "trash")
                    }
                } label: {
                    Image(systemName: "ellipsis.circle")
                }
            }
        }
    }
    
    func swipeLeft() {
        withAnimation {
            xOffset = -500
        } completion: {
            wordKeys.append(wordKeys.first!)
            wordKeys.remove(at: 0)
            colors.append(colors.first!)
            colors.remove(at: 0)
            xOffset = 0
            isFlipped = false
        }
    }
    
    func swipeRight() {
        withAnimation {
            xOffset = 500
        } completion: {
            wordKeys.remove(at: 0)
            colors.append(colors.first!)
            colors.remove(at: 0)
            xOffset = 0
            isFlipped = false
        }
    }
}

#Preview {
    let translations = [
        "en": Translations(commentary: "commentary", definition: "flat and bendable object, e.g. paper, card, leaf; written text or document, e.g. book, website, clay tablet", etymology: [TranslationsEtymology(definition: "definition", language: "language")], sp_etymology: "sitelen etymology")
    ]
    DeckView(title: "Deck Title", type: "vocab", words: ["lipu": Word(word: "lipu", book: "pu", source_language: "Finnish", usage_category: "core", etymology: [Etymology(word: "word")], translations: translations), "toki": Word(word: "toki", book: "pu", source_language: "Finnish", usage_category: "core", etymology: [Etymology(word: "word")], translations: translations), "pona": Word(word: "pona", book: "pu", source_language: "Finnish", usage_category: "core", etymology: [Etymology(word: "word")], translations: translations)], isCustom: true)
}
