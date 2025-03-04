//
//  ClassroomView.swift
//  lipu lipu
//
//  Created by HPro2 on 12/19/24.
//

import SwiftUI

struct ClassroomView: View {
    var lessons: [[String]] = getLessons() // lesson[0] = lessonName; lesson[1] = category; lesson[2] = tokiWord; lesson[3] = key vocab; lesson[4...10] = text blocks
    
    var body: some View {
        NavigationStack {
            List {
                //: BASICS
                Section(header: Text("Basics")) {
//                    LessonPreviewCellView(lessonNumber: 1, lessonName: "Introduction", tokiWord: "toki-pona", isComplete: false, destination: PronounciationLessonView())
//                    LessonPreviewCellView(lessonNumber: 2, lessonName: "Pronounciation & Spelling", tokiWord: "kalama", isComplete: false, destination: PronounciationLessonView())
                    ForEach(lessons, id: \.self) { lesson in
                        if lesson[1] == "Basics" {
                            LessonPreviewCellView(lessonNumber: 1, lessonName: lesson[0], tokiWord: lesson[2], isComplete: false, destination: LessonView(lesson: lesson))
                        }
                    }
                }
            }
            .navigationTitle("Lessons")
            .listStyle(InsetListStyle())
        }
    }
}

func getLessons() -> [[String]] {
    var fileData: [String]
    var phraseList: [[String]]
    if let filePath = Bundle.main.path(forResource: "lessons", ofType: "txt") {
        if let fileContents = try? String(contentsOfFile: filePath, encoding: .ascii) {
            fileData = fileContents.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: "\n\n")
            phraseList = Array(repeating: ["", "", "", "", "", "", "", "", "", ""], count: fileData.count)
            fileData.sort()
            for line in fileData {
                let index = fileData.firstIndex(of: line)
                phraseList[index!] = (line.components(separatedBy: "\n"))
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
    ClassroomView()
}
