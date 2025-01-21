//
//  CreditsView.swift
//  lipu lipu
//
//  Created by HPro2 on 12/19/24.
//

import SwiftUI

struct CreditsView: View {
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
                    Text("v1.0.0")
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
                    HStack {
                        Link(destination: URL(string: "https://github.com/nickhatzz/lipu-lipu")!) {
                            Text("GitHub Repository")
                        }
                        Spacer()
                        Image(systemName: "safari")
                            .foregroundStyle(.tertiary)
                    }
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
                        Button("Reset Classroom Progress", action: {
                            
                        })
                        .foregroundStyle(.foreground)
                        Spacer()
                        Image(systemName: "trash")
                            .foregroundStyle(.tertiary)
                    }
                    HStack {
                        Button("Reset Flashcard Data", action: {
                            
                        })
                        .foregroundStyle(.foreground)
                        Spacer()
                        Image(systemName: "trash")
                            .foregroundStyle(.tertiary)
                    }
                }
                //: ACKNOWLEDGEMENTS
                Section(header: Text("Acknowledgements")) {
                    Text("Toki Pona was created by Sonja Lang")
                    HStack {
                        Link(destination: URL(string: "https://tokipona.org")!) {
                            Text("Official Toki Pona books")
                        }
                        Spacer()
                        Image(systemName: "safari")
                            .foregroundStyle(.tertiary)
                    }
                    HStack {
                        Link(destination: URL(string: "https://nimi.li")!) {
                            Text("Definitions sourced from nimi.li")
                        }
                        Spacer()
                        Image(systemName: "safari")
                            .foregroundStyle(.tertiary)
                    }
                    HStack {
                        Link(destination: URL(string: "https://www.kreativekorp.com/software/fonts/sitelenselikiwen/")!) {
                            Text("Sitelen pona font: sitelen seli kiwen")
                        }
                        Spacer()
                        Image(systemName: "safari")
                            .foregroundStyle(.tertiary)
                    }
                }
            }
            .navigationTitle("About")
            .listSectionSpacing(15)
        }
    }
}

#Preview {
    CreditsView()
}
