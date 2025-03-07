//
//  WordModel.swift
//  lipu lipu
//
//  Created by HPro2 on 3/7/25.
//

import Foundation

struct Word: Codable {
    struct Translations: Codable {
        let definition: String
    }
    
    let word: String
    let book: String
    let source_language: String
    let usage_category: String
    let translations: [String: Translations]
}
