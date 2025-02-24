//
//  AppIconSettingView.swift
//  lipu lipu
//
//  Created by Nick on 1/21/25.
//

import SwiftUI

struct AppIconSettingView: View {
    var icons: [String] = ["logo", "2", "3", "4", "5", "6"]
    let adaptiveColumn = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: adaptiveColumn, spacing: 10) {
                    ForEach(icons, id: \.self) { icon in
                        Button {
                            UIApplication.shared.setAlternateIconName(icon)
                        } label: {
                            VStack {
                                Image("logo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                Text(icon)
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
