//
//  WordModel.swift
//  lipu lipu
//
//  Created by HPro2 on 3/7/25.
//

import Foundation

struct Word: Codable {
    let word: String
    let book: String
    let source_language: String
    let usage_category: String
    let etymology: [Etymology]
    let translations: [String: Translations]
}

struct Translations: Codable {
    let commentary: String
    let definition: String
    let etymology: [TranslationsEtymology]
    let sp_etymology: String
}

struct Etymology: Codable {
    let word: String?
}

struct TranslationsEtymology: Codable {
    let definition: String?
    let language: String
}
