//
//  DisplaySettingView.swift
//  lipu lipu
//
//  Created by Nick on 1/21/25.
//

import SwiftUI

struct DisplaySettingView: View {
    @StateObject private var appearanceManager = AppearanceManager.shared
    
    let insets = EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
    
    struct SectionHeader: View {
        var title: String
        
        var body: some View {
            Text(title)
                .font(.title2)
                .textCase(nil)
                .fontWeight(.bold)
                .foregroundStyle(.foreground)
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                //: APPEARANCE
                Section(header: SectionHeader(title: "Appearance").listRowInsets(insets)) {
                    Picker("Appearance", selection: $appearanceManager.appearanceChoice) {
                        Text("System").tag("system")
                        Text("Dark").tag("dark")
                        Text("Light").tag("light")
                    }
                    .pickerStyle(.segmented)
                }
                //: TINT COLOR
                Section(header: SectionHeader(title: "Tint Color").listRowInsets(insets)) {
                    
                }
            }
            .navigationTitle("Display")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    DisplaySettingView()
}
