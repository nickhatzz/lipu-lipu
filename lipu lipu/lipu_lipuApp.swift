//
//  lipu_lipuApp.swift
//  lipu lipu
//
//  Created by HPro2 on 12/19/24.
//

import SwiftUI

@main
struct lipu_lipuApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
