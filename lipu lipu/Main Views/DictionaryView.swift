//
//  DictionaryView.swift
//  lipu lipu
//
//  Created by HPro2 on 12/19/24.
//

import SwiftUI

struct DictionaryView: View {
    @State private var searchText = ""
    var words: [[String]] = getWords() // word[0] = word; word[1] = translations; word[2] = source
    @State var apiWords: [String: Word] = [:]
    
    var body: some View {
        
        NavigationStack {
            List {
//                ForEach(searchResults, id: \.self) { word in
//                    NavigationLink(destination: WordView(word: word[0], translations: word[1], source: word[2])) {
//                        WordPreviewCellView(word: word[0], translations: word[1], source: word[2])
//                    }
//                }
                ForEach(apiWords.keys.sorted(by: <), id: \.self) { key in
                    NavigationLink(destination: WordView(word: apiWords[key]!.word, translations: apiWords[key]!.translations["en"]!.definition, source: apiWords[key]!.word)) {
                        WordPreviewCellView(word: apiWords[key]!.word, translations: apiWords[key]!.translations["en"]!.definition, source: apiWords[key]!.word)
                    }
                }
            }
            .navigationTitle("Dictionary")
            .onAppear {
                apiCall().getWords { (words) in
                    self.apiWords = words
                }
            }
        }
        .searchable(text: $searchText)

    }
    
    var searchResults: [[String]] {
        if searchText.isEmpty {
            return words
        } else {
            let tokiFilter = words.filter { word in
                word[0].hasPrefix(searchText.lowercased())
            }
            if !tokiFilter.isEmpty {
                return tokiFilter
            }
            return words.filter { word in
                word[1].contains(searchText.lowercased())
            }
        }
    }
    
}

func getWords() -> [[String]] {
    var fileData: [String]
    var wordsList: [[String]]
    if let filePath = Bundle.main.path(forResource: "words", ofType: "txt") {
        if let fileContents = try? String(contentsOfFile: filePath, encoding: .ascii) {
            fileData = fileContents.components(separatedBy: "\n")
            fileData.remove(at: fileData.firstIndex(of: "") ?? 0)
            fileData.sort()
            wordsList = Array(repeating: ["", "", ""], count: fileData.count)
            for line in fileData {
                let index = fileData.firstIndex(of: line)
                if !line.isEmpty {
                    wordsList[index!] = (line.components(separatedBy: ": "))
                }
            }
            return wordsList
        } else {
            print(":(")
        }
    } else {
        print(":(")
    }
    return [["Error! Could not load dictionary!"]]
}

#Preview {
    DictionaryView()
}
