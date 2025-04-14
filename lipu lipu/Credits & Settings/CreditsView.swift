//
//  CreditsView.swift
//  lipu lipu
//
//  Created by HPro2 on 12/19/24.
//

import SwiftUI

struct CreditsView: View {
    @Environment(\.modelContext) var modelContext
    @State private var showingResetCardsAlert = false
    
    var body: some View {
        NavigationStack {
            List {
                //: APP INFORMATION
                VStack {
                    Text("lipu lipu")
                        .font(.title)
                        .fontWeight(.bold)
                    HStack {
                        Spacer()
                        Image("logo")
                            .resizable()
                            .frame(width: 150, height: 150)
                        Spacer()
                    }
                    Text("v\(Bundle.main.infoDictionary?["CFBundleShortVersionString"] ?? "0.0.0")")
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundStyle(.secondary)
                    Text("lipu lipu is a Toki Pona learning resource for iOS")
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundStyle(.secondary)
                    Text("Created 100% with SwiftUI")
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundStyle(.secondary)
                }
                Section {
                    Text("App created by Nick Hatzidakis")
                    LinkButtonView(link: "https://github.com/nickhatzz/lipu-lipu", label: "GitHub Repository")
                }
                //: SETTINGS
                Section(header: Text("Settings")) {
                    ZStack {
                        HStack {
                            Text("Display")
                            Spacer()
                            Image(systemName: "paintbrush")
                                .foregroundStyle(.tertiary)
                        }
                        NavigationLink(destination: DisplaySettingView()) {}
                            .opacity(0)
                    }
                    ZStack {
                        HStack {
                            Text("App Icon")
                            Spacer()
                            Image(systemName: "app.dashed")
                                .foregroundStyle(.tertiary)
                        }
                        NavigationLink(destination: AppIconSettingView()) {}
                            .opacity(0)
                    }
                }
                Section {
                    HStack {
                        Button("Reset Flashcard Data", action: {
                            showingResetCardsAlert = true
                        })
                        .alert(isPresented: $showingResetCardsAlert) {
                            Alert(
                                title: Text("Reset all flashcard data?"),
                                message: Text("This action cannot be undone."),
                                primaryButton: .destructive(Text("Reset"), action: deleteFlashcardData),
                                secondaryButton: .cancel(Text("Cancel"))
                            )
                        }
                        .foregroundStyle(.foreground)
                        Spacer()
                        Image(systemName: "trash")
                            .foregroundStyle(.tertiary)
                    }
                }
                //: ACKNOWLEDGEMENTS
                Section(header: Text("Acknowledgements")) {
                    Text("Toki Pona was created by Sonja Lang")
                    LinkButtonView(link: "https://tokipona.org", label: "Official Toki Pona books")
                    LinkButtonView(link: "https://linku.la/about", label: "Definitions from sona Linku")
                    LinkButtonView(link: "https://www.kreativekorp.com/software/fonts/sitelenselikiwen/", label: "Sitelen pona font: sitelen seli kiwen")
                }
            }
            .navigationTitle("About")
            .listSectionSpacing(15)
        }
    }
    
    func deleteFlashcardData() {
        try! modelContext.delete(model: CustomDeck.self)
    }
}

#Preview {
    CreditsView()
}
