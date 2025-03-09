//
//  LessonModel.swift
//  lipu lipu
//
//  Created by Nick Hatzidakis on 3/7/25.
//

import Foundation

struct Lesson: Codable {
    let title: String
    let category: String
    let sitelen: String
    let vocab: [String]
    let sections: [LessonSection]
}

struct LessonSection: Codable {
    let title: String
    let text: String
}
