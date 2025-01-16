//
//  CreditsView.swift
//  lipu lipu
//
//  Created by HPro2 on 12/19/24.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        Text("lipu lipu Credits")
            .font(.headline)
        Spacer()
        List {
            Text("Created with ♥ in SwiftUI")
            Text("Toki Pona was created by Sonja Lang")
            Text("Definitions sourced from [nimi.li](https://nimi.li)")
            Text("Sitelen pona font: [sitelen seli kiwen](https://www.kreativekorp.com/software/fonts/sitelenselikiwen/)")
        }
        Spacer()
    }
}

#Preview {
    CreditsView()
}
