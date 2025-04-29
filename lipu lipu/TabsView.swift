//
//  ContentView.swift
//  lipu lipu
//
//  Created by HPro2 on 12/19/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var appearanceManager = AppearanceManager.shared
    @State var selection = 0;

    var body: some View {
        TabView(selection: $selection) {
            Tab("Dictionary", systemImage: "a.book.closed.fill", value: 0) {
                DictionaryView()
            }
            
            Tab("Flashcards", systemImage: "paperclip", value: 1) {
                FlashcardsView()
            }
            
            Tab("Phrasebook", systemImage: "book.fill", value: 2) {
                PhrasebookView()
            }

            Tab("Classroom", systemImage: "graduationcap.fill", value: 3) {
                ClassroomView()
            }

            Tab("About", systemImage: "info.square.fill", value: 4) {
                CreditsView()
            }
        }
        .preferredColorScheme(appearanceManager.getAppearanceChoice())
        .tint(appearanceManager.getAccentColor())
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
