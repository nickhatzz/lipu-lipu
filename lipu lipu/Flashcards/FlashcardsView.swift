//
//  FlashcardsView.swift
//  lipu lipu
//
//  Created by HPro2 on 12/19/24.
//

import SwiftUI

struct FlashcardsView: View {
    var body: some View {
        NavigationStack {
            List {
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 30) {
                        DeckPreview(title: "Vocabulary", sampleWords: ["toki", "lipu", "kijetesantakalu"], colors: [.red, .orange, .yellow])
                        DeckPreview(title: "Sitelen Pona", sampleWords: ["moku", "kulupu", "toki-pona"], colors: [.cyan, .blue, .purple])
                        DeckPreview(title: "Basic Sentences", sampleWords: ["ona", "li", "moku"], colors: [.green, .mint, .indigo])
                    }
                    .padding(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5))
                }
            }
            .navigationTitle("Flashcards")
        }
    }
}

#Preview {
    FlashcardsView()
}
