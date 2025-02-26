//
//  AppIconSettingView.swift
//  lipu lipu
//
//  Created by Nick on 1/21/25.
//

import SwiftUI

struct AppIconSettingView: View {
    var icons: [String] = ["AppIcon1", "AppIcon2", "AppIcon3", "AppIcon4", "AppIcon5"]
    let adaptiveColumn = [
        GridItem(.fixed(110)),
        GridItem(.fixed(110)),
        GridItem(.fixed(110))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: adaptiveColumn, spacing: 10) {
                    // default icon
                    Button {
                        UIApplication.shared.setAlternateIconName(nil)
                    } label: {
                        VStack {
                            Image("AppIconImage")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .cornerRadius(15)
                        }
                    }
                    // other icons
                    ForEach(icons, id: \.self) { icon in
                        Button {
                            UIApplication.shared.setAlternateIconName(icon)
                        } label: {
                            VStack {
                                Image("\(icon)Image")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(15)
                            }
                        }
                    }
                }
            }
            .navigationTitle("App Icon")
        }
    }
}

#Preview {
    AppIconSettingView()
}
