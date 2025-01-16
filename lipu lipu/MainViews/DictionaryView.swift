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
        
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) { word in
                    NavigationLink(destination: WordView(word: word[0], translations: word[1], source: word[2])) {
                        WordPreviewCellView(word: word[0], translations: word[1], source: word[2])
                    }
                }
            }
            .navigationTitle("Dictionary")
        }
        .searchable(text: $searchText)

    }
    
    var searchResults: [[String]] {
        if searchText.isEmpty {
            return words
        } else {
            return words.filter { word in
                word[0].contains(searchText.lowercased())
            }
        }
    }
    
}

func getWords() -> [[String]] {
    let fileData: [String]
    var wordsList: [[String]]
    if let filePath = Bundle.main.path(forResource: "words", ofType: "txt") {
        if let fileContents = try? String(contentsOfFile: filePath, encoding: .ascii) {
            fileData = fileContents.components(separatedBy: "\n")
            wordsList = Array(repeating: ["", "", ""], count: fileData.count - 1)
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
