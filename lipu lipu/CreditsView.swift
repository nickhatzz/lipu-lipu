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
        VStack {
            Text("App created by Nick Hatzidakis")
            Text("Toki Pona was created by Sonja Lang")
            Text("Definitions and sitelen pona sourced from [nimi.li](https://nimi.li)")
        }
        Spacer()
    }
}

#Preview {
    CreditsView()
}
