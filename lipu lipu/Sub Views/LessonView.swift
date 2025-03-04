//
//  LessonView.swift
//  lipu lipu
//
//  Created by Nick on 1/19/25.
//

import SwiftUI

struct LessonView: View {
    let lesson: [String] // lesson[0] = lessonName; lesson[1] = category; lesson[2] = tokiWord; lesson[3] = key vocab; lesson[4...10] = text blocks
    
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
                Section(header: Text("Key Vocab")) {
                    ForEach(lesson[3].components(separatedBy: ", "), id: \.self) { vocab in
                        VStack(alignment: .leading) {
                            Text(vocab)
                            Text(vocab)
                                .font(Font.custom("sitelenselikiwenmonoasuki", size: 18))
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                
                //: TEXT BLOCKS
            }
        }
    }
}

#Preview {
    LessonView(lesson: ["Lesson Title", "Category", "toki-pona", "toki, pona, kalama", "text block 1", "text block 2"])
}
