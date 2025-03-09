//
//  PhrasebookView.swift
//  lipu lipu
//
//  Created by HPro2 on 12/19/24.
//

import SwiftUI

struct PhrasebookView: View {
    @State private var searchText = ""
    var phrases: [[String]] = getPhrases()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) { phrase in
                    NavigationLink(destination: PhraseView(phrase: phrase[0], translations: phrase[1])) {
                        PhrasePreview(phrase: phrase[0], translations: phrase[1])
                    }
                }
            }
            .navigationTitle("Phrasebook")
        }
        .searchable(text: $searchText)
    }
    
    var searchResults: [[String]] {
        if searchText.isEmpty {
            return phrases
        } else {
            return phrases.filter { phrase in
                phrase[0].contains(searchText.lowercased())
            }
        }
    }
}

func getPhrases() -> [[String]] {
    var fileData: [String]
    var phraseList: [[String]]
    if let filePath = Bundle.main.path(forResource: "phrases", ofType: "txt") {
        if let fileContents = try? String(contentsOfFile: filePath, encoding: .ascii) {
            fileData = fileContents.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: "\n")
            phraseList = Array(repeating: ["", ""], count: fileData.count)
            fileData.sort()
            for line in fileData {
                let index = fileData.firstIndex(of: line)
                phraseList[index!] = (line.components(separatedBy: ": "))
            }
            return phraseList
        } else {
            print(":(")
        }
    } else {
        print(":(")
    }
    return [["Error! Could not load dictionary!"]]
}

#Preview {
    PhrasebookView()
}
