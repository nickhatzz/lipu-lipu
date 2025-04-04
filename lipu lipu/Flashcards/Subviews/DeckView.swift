//
//  DeckView.swift
//  lipu lipu
//
//  Created by HPro2 on 4/3/25.
//

import SwiftUI

struct DeckView: View {
    let title: String
    let type: String
    let words: [String: Word]
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    DeckView(title: "Title", type: "vocab", words: [:])
}
