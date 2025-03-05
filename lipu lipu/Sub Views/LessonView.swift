//
//  LessonView.swift
//  lipu lipu
//
//  Created by Nick on 1/19/25.
//

import SwiftUI

struct LessonView: View {
    let lesson: [String] // lesson[0] = lessonName; lesson[1] = category; lesson[2] = tokiWord; lesson[3] = key vocab; lesson[4+] = text blocks
    var words: [[String]] = getWords() // word[0] = word; word[1] = translations; word[2] = source
    
    var body: some View {
        NavigationStack {
            //: TITLE
            HStack {
                Text(lesson[2])
                    .frame(width: 75, height: 75, alignment: .center)
                    .scaledToFill()
                    .font(Font.custom("sitelenselikiwenmonoasuki", size: 80))
                
                VStack(alignment: .leading) {
                    Text(lesson[0])
                        .font(.title)
                    HStack {
                        Text(lesson[1])
                            .font(.subheadline)
                    }
                }
                .padding(.leading, 5)
                
                Spacer()
            }
            .padding(.leading, 5)
            
            List {
                //: KEY VOCAB
                if lesson[3] != "none" {
                    Section(header: Text("Key Vocab")) {
                        let wordsList: [String] = words.compactMap({ $0.first })
                        ForEach(lesson[3].components(separatedBy: ", "), id: \.self) { vocab in
                            let wordIndex = wordsList.firstIndex(of: vocab)
                            NavigationLink(destination: WordView(word: words[wordIndex!][0], translations: words[wordIndex!][1], source: words[wordIndex!][2])) {
                                HStack {
                                    // TOKI PONA WORD
                                    VStack(alignment: .leading) {
                                        Text(vocab)
                                        Text(vocab)
                                            .font(Font.custom("sitelenselikiwenmonoasuki", size: 18))
                                            .foregroundStyle(.secondary)
                                    }
                                    Spacer()
                                    // TRANSLATIONS
                                    VStack {
                                        Text(words[wordIndex!][1])
                                            .lineLimit(2)
                                            .frame(width: 150, alignment: .leading)
                                    }
                                }
                            }
                        }
                    }
                }
                
                //: TEXT BLOCKS
                ForEach(lesson, id: \.self) { segment in
                    if lesson.firstIndex(of: segment)! > 3 {
                        let textBlockArray = segment.components(separatedBy: " : ") // textBlockArray[0] = title; textBlockArray[1] = text
                        Section(header: Text(textBlockArray[0])) {
                            Text(textBlockArray[1].replacingOccurrences(of: "§", with: "\n"))
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    LessonView(lesson: ["Lesson Title", "Category", "toki-pona", "toki, pona, kalama", "text block 1 : Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. §§Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", "text block 2 : Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."])
}
