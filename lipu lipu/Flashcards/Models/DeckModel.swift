//
//  DeckModel.swift
//  lipu lipu
//
//  Created by Nick on 4/10/25.
//

import SwiftData

@Model
class CustomDeck {
    var title: String
    var type: String
    var words: [String: Word]
    
    init(title: String, type: String, words: [String : Word]) {
        self.title = title
        self.type = type
        self.words = words
    }
}
