//
//  DeckCreationView.swift
//  lipu lipu
//
//  Created by HPro2 on 4/9/25.
//

import SwiftUI

struct DeckCreationView: View {
    @State var words: [String: Word] = [:]
    
    @State var searchText: String = ""
    @State var titleText: String = ""
    @State var typeSelection: String = "vocab"
    
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
            // title
            VStack {
                HStack {
                    SectionHeader(title: "Deck Title")
                    Spacer()
                }
                TextField("Enter deck title...", text: $titleText)
                    .textFieldStyle(.roundedBorder)
            }
            .padding()
            
            VStack {
                HStack {
                    SectionHeader(title: "Deck type")
                    Spacer()
                }
                Picker(selection: $typeSelection, label: Text("Deck Type")) {
                    Text("Vocabulary").tag("vocab")
                    Text("Sitelen Pona").tag("sitelen")
                }
                .pickerStyle(.segmented)
            }
            .padding()
            
            // words list
            List {
                if !words.isEmpty {
                    ForEach(searchResults, id: \.self) { word in
                        WordCheckboxView(word: words[word]!)
                    }
                }
            }
            .searchable(text: $searchText)
            .onAppear {
                apiCall().getWords { (words) in
                    self.words = words
                }
            }
            .toolbar {
                Button {
                    
                } label: {
                    Image(systemName: "bin.xmark")
                }
                .tint(.red)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "checkmark")
                }
                .tint(.green)
            }
        }
    }
    
    var searchResults: [String] {
        let wordKeys = words.keys.sorted(by: <)
        if searchText.isEmpty {
            return wordKeys.filter { key in
                words[key]!.usage_category != "obscure"
            }
        } else {
            let tokiFilter = wordKeys.filter { key in
                key.hasPrefix(searchText.lowercased()) && words[key]!.usage_category != "obscure"
            }
            if !tokiFilter.isEmpty {
                return tokiFilter
            }
            return wordKeys.filter { key in
                words[key]!.translations["en"]!.definition.lowercased().contains(searchText.lowercased()) && words[key]!.usage_category != "obscure"
            }
        }
    }
}

#Preview {
    DeckCreationView()
}
