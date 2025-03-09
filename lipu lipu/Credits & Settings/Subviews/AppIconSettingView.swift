//
//  AppIconSettingView.swift
//  lipu lipu
//
//  Created by Nick on 1/21/25.
//

import SwiftUI

struct AppIconSettingView: View {
    var colorIcons: [String] = ["Red", "Orange", "Yellow", "Green", "Blue", "Pink"]
    var tokiPonaIcons: [String] = ["Toki Pona", "Pu", "Kijetesantakalu", "Mun", "Suwi"]
    var funIcons: [String] = ["Y2.01K", "Kalama", "Musi"]
    
    let insets = EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
    
    
    struct AppIconButton: View {
        var icon: String
        
        var body: some View {
            Button {
                if icon == "Classic" {
                    UIApplication.shared.setAlternateIconName(nil)
                } else {
                    UIApplication.shared.setAlternateIconName("\(icon)AppIcon")
                }
            } label: {
                HStack {
                    Image("\(icon)Image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .cornerRadius(12)
                    Text(icon)
                        .font(.headline)
                }
            }
            .buttonStyle(.plain)
        }
    }
    
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
                //: DEFAULT ICON
                Section(header: SectionHeader(title: "Default").listRowInsets(insets)) {
                    AppIconButton(icon: "Classic")
                }
                .headerProminence(.increased)

                //: COLOR ICONS
                Section(header: SectionHeader(title: "Colors").listRowInsets(insets)) {
                    ForEach(colorIcons, id: \.self) { icon in
                        AppIconButton(icon: icon)
                    }
                }
                //: TOKI PONA ICONS
                Section(header: SectionHeader(title: "Toki Pona").listRowInsets(insets)) {
                    ForEach(tokiPonaIcons, id: \.self) { icon in
                        AppIconButton(icon: icon)
                    }
                }
                //: FUN ICONS
                Section(header: SectionHeader(title: "Fun").listRowInsets(insets)) {
                    ForEach(funIcons, id: \.self) { icon in
                        AppIconButton(icon: icon)
                    }
                }
            }
            .navigationTitle("App Icon")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AppIconSettingView()
}
