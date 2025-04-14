//
//  ClassroomView.swift
//  lipu lipu
//
//  Created by HPro2 on 12/19/24.
//

import SwiftUI

struct ClassroomView: View {
    var lessons: [Lesson] = decodeLessons()
    
    var body: some View {
        NavigationStack {
            List {
                //: BASICS
                Section(header: SectionHeader(title: "Basics")) {
                    ForEach(lessons, id: \.title) { lesson in
                        let index = lessons.firstIndex(where: { $0.title == lesson.title })! + 1
                        if lesson.category == "Basics" {
                            LessonPreview(lessonNumber: index, lesson: lesson)
                        }
                    }
                }
            }
            .navigationTitle("Lessons")
            .listStyle(InsetListStyle())
        }
    }
}

func decodeLessons() -> [Lesson] {
    let lessons: [Lesson]
    if let filePath = Bundle.main.path(forResource: "lessons", ofType: "JSON") {
        if let fileContents = try? String(contentsOfFile: filePath, encoding: .utf8) {
            let fileData = fileContents.data(using: .utf8)
            lessons = try! JSONDecoder().decode([Lesson].self, from: fileData!)
            return lessons
        } else {
            print(":(")
        }
    } else {
        print(":(")
    }
    return []
}

#Preview {
    ClassroomView()
}
