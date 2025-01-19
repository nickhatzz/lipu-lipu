//
//  ContentView.swift
//  lipu lipu
//
//  Created by HPro2 on 12/19/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var selection = 0;

    var body: some View {
        TabView(selection: $selection) {
            Tab("Dictionary", systemImage: "a.book.closed.fill", value: 0) {
                DictionaryView()
            }
            
            Tab("Phrasebook", systemImage: "book.fill", value: 2) {
                PhrasesView()
            }

            Tab("Classroom", systemImage: "graduationcap.fill", value: 3) {
                ClassroomView()
            }
            
            Tab("Flashcards", systemImage: "paperclip", value: 1) {
                FlashcardsView()
            }

            Tab("About", systemImage: "info.square.fill", value: 4) {
                CreditsView()
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
