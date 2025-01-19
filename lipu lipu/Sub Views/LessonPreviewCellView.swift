//
//  LessonPreviewCellView.swift
//  lipu lipu
//
//  Created by HPro2 on 1/9/25.
//

import SwiftUI

struct LessonPreviewCellView<Content: View>: View {
    @Environment(\.colorScheme) var colorScheme
    let lessonNumber: Int
    let lessonName: String
    let tokiWord: String
    @ViewBuilder let destination: Content
    
    var borderColor: UIColor = UIColor.tertiaryLabel
    
    init(lessonNumber: Int, lessonName: String, tokiWord: String, isComplete: Bool, destination: Content) {
        self.lessonNumber = lessonNumber
        self.lessonName = lessonName
        self.tokiWord = tokiWord
        self.destination = destination
        
        if isComplete {
            borderColor = UIColor.systemGreen
        }
    }
    
    var body: some View {
        ZStack {
            HStack {
                Text("\(lessonNumber). ")
                    .font(Font.system(size: 25))
                Text("\(lessonName)")
                    .font(Font.system(size: 25))
                Spacer()
                Text(tokiWord)
                    .frame(width: 75, height: 75, alignment: .center)
                    .scaledToFill()
                    .font(Font.custom("sitelenselikiwenmonoasuki", size: 80))
            }
            .padding(10)
            NavigationLink (destination: destination) {}.opacity(0)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10, style: .circular).stroke(Color(borderColor), lineWidth: 2)
        )
        
    }
}
