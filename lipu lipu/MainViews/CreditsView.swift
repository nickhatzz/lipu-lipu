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
            Form {
                VStack {
                    HStack {
                        Spacer()
                        Image("logo")
                            .resizable()
                            .frame(width: 150, height: 150)
                        Spacer()
                    }
                    Text("lipu lipu")
                        .font(.headline)
                        .fontWeight(.medium)
                    Text("Created in SwiftUI")
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundStyle(.gray)
                }
                List {
                    Section(header: Text("Acknowledgements")) {
                        Text("Toki Pona was created by Sonja Lang")
                        Text("Definitions sourced from [nimi.li](https://nimi.li)")
                        Text("Sitelen pona font: [sitelen seli kiwen](https://www.kreativekorp.com/software/fonts/sitelenselikiwen/)")
                    }
                }
            }
            .navigationTitle("Credits")
            .scrollDisabled(true)
        }
    }
}

#Preview {
    CreditsView()
}
