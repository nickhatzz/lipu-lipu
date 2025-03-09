//
//  LessonPreview.swift
//  lipu lipu
//
//  Created by HPro2 on 1/9/25.
//

import SwiftUI

struct LessonPreview: View {
    let lessonNumber: Int
    let lesson: Lesson
    
    var borderColor: UIColor = UIColor.tertiaryLabel
    
    init(lessonNumber: Int, lesson: Lesson, isComplete: Bool) {
        self.lesson = lesson
        self.lessonNumber = lessonNumber
        
        if isComplete {
            borderColor = UIColor.systemGreen
        }
    }
    
    var body: some View {
        ZStack {
            HStack {
                Text("\(lessonNumber). ")
                    .font(Font.system(size: 25))
                Text(lesson.title)
                    .font(Font.system(size: 25))
                Spacer()
                Text(lesson.sitelen)
                    .frame(width: 75, height: 75, alignment: .center)
                    .scaledToFill()
                    .font(Font.custom("sitelenselikiwenmonoasuki", size: 80))
            }
            .padding(10)
            NavigationLink (destination: LessonView(lesson: lesson)) {}.opacity(0)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10, style: .circular).stroke(Color(borderColor), lineWidth: 2)
        )
        
    }
}

#Preview {
    LessonPreview(lessonNumber: 1, lesson: Lesson(title: "Lesson", category: "Basics", sitelen: "toki-pona", vocab: [], sections: []), isComplete: false)
}
