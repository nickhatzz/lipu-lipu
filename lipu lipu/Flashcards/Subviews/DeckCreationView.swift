//
//  DeckCreationView.swift
//  lipu lipu
//
//  Created by HPro2 on 4/9/25.
//

import SwiftUI

struct DeckCreationView: View {    
    @StateObject private var appearanceManager = AppearanceManager.shared
    @Environment(\.modelContext) var modelContext
    @Environment(\.presentationMode) var presentationMode
    
    @State var words: [String: Word] = [:]
    @State var selectedWords: [String: Word] = [:]
    @State var searchText: String = ""
    @State var titleText: String = ""
    @State var typeSelection: String = "vocab"
    
    let adaptiveColumn = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    struct SectionHeader: View {
        var title: String
        
        var body: some View {
            Text(title)
                .frame(alignment: .leading)
                .font(.title2)
                .textCase(nil)
                .fontWeight(.bold)
                .foregroundStyle(.foreground)
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                //: TITLE
                Section(header: SectionHeader(title: "Title")) {
                    TextField("Enter deck title...", text: $titleText)
                    .navigationTitle("Create a deck")
                    .onAppear {
                        apiCall().getWords { (words) in
                            self.words = words
                        }
                    }
                    .toolbar {
                        Button {
                            guard !selectedWords.isEmpty else { return }
                            let deck = CustomDeck(title: titleText, type: typeSelection, words: selectedWords)
                            modelContext.insert(deck)
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "checkmark.rectangle.stack.fill")
                        }
                    }
                }
                
                //: TYPE
                Section(header: SectionHeader(title: "Type")) {
                    Picker(selection: $typeSelection, label: Text("Deck Type")) {
                        Text("Vocabulary").tag("vocab")
                        Text("Sitelen Pona").tag("sitelen")
                    }
                    .pickerStyle(.segmented)
                }
                
                //: WORDS LIST
                Section(header: SectionHeader(title: "Words")) {
                    LazyVGrid(columns: adaptiveColumn, spacing: 12) {
                        if !words.isEmpty {
                            ForEach(words.keys.sorted(by: <), id: \.self) { word in
                                Button {
                                    withAnimation {
                                        if selectedWords.keys.contains(where: { $0 == word }) {
                                            selectedWords.removeValue(forKey: word)
                                        } else {
                                            selectedWords[word] = words[word]
                                        }
                                    }
                                } label: {
                                    VStack {
                                        Text(word)
                                            .font(Font.custom("sitelenselikiwenmonoasuki", size: 75))
                                            .foregroundStyle(.secondary)
                                        Text(word)
                                            .font(.callout)
                                            .bold()
                                    }
                                    .frame(width: 90)
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(Color(UIColor.tertiarySystemFill))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30, style: .circular).stroke(selectedWords.keys.contains(where: { $0 == word }) ? appearanceManager.getAccentColor() : .secondary, lineWidth: 3)
                                )
                            }
                        }
                    }
                }
            }
            .listStyle(.inset)
        }
    }
}

#Preview {
    DeckCreationView()
}
