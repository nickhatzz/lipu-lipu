//
//  DictionaryView.swift
//  lipu lipu
//
//  Created by HPro2 on 12/19/24.
//

import SwiftUI

struct DictionaryView: View {
    @State private var searchText = ""
    @State var words: [String: Word] = [:]
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) { key in
                    NavigationLink(destination: WordView(word: words[key]!)) {
                        WordPreview(word: words[key]!)
                    }
                }
            }
            .navigationTitle("Dictionary")
            .onAppear {
                apiCall().getWords { (words) in
                    self.words = words
                }
            }
        }
        .searchable(text: $searchText)

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
    DictionaryView()
}
