//
//  LessonView.swift
//  lipu lipu
//
//  Created by Nick on 1/19/25.
//

import SwiftUI

struct LessonView: View {
    @State var lesson: Lesson
    @State var words: [String: Word] = [:]
    
    var body: some View {
        NavigationStack {
            //: TITLE
            HStack {
                Text(lesson.sitelen)
                    .frame(width: 75, height: 75, alignment: .center)
                    .scaledToFill()
                    .font(Font.custom("sitelenselikiwenmonoasuki", size: 80))
                
                VStack(alignment: .leading) {
                    Text(lesson.title)
                        .font(.title)
                    HStack {
                        Text(lesson.category)
                            .font(.subheadline)
                    }
                }
                .padding(.leading, 5)
                
                Spacer()
            }
            .padding(.leading, 5)
            
            List {
                //: KEY VOCAB
                if !lesson.vocab.isEmpty && !words.isEmpty {
                    Section(header: Text("Key Vocab")) {
                        ForEach(lesson.vocab, id: \.self) { term in
                            VocabPreview(word: words[term]!)
                        }
                    }
                }
                
                // : TEXT BLOCKS
                ForEach(lesson.sections, id: \.title) { section in
                    Section(header: Text(section.title)) {
                        Text(section.text)
                    }
                }
            }
            .onAppear {
                apiCall().getWords { (words) in
                    self.words = words
                }
            }
        }
        .animation(.bouncy)
    }
}

#Preview {
    LessonView(lesson: Lesson(title: "Title", category: "Category", sitelen: "toki-pona", vocab: ["toki", "pona"], sections: [LessonSection(title: "Title", text: "Text")]))
}
