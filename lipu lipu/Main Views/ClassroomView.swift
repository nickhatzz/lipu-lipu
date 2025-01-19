//
//  ClassroomView.swift
//  lipu lipu
//
//  Created by HPro2 on 12/19/24.
//

import SwiftUI

struct ClassroomView: View {
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Basics")) {
                    LessonPreviewCellView(lessonNumber: 1, lessonName: "Pronounciation", tokiWord: "kalama", isComplete: false, destination: PronounciationLessonView())
                }
            }
            .navigationTitle("Lessons")
            .listStyle(InsetListStyle())
        }
    }
}

#Preview {
    ClassroomView()
}
