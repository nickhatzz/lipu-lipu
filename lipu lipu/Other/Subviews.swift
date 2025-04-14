//
//  Subviews.swift
//  lipu lipu
//
//  Created by HPro2 on 4/14/25.
//

import SwiftUI

struct SectionHeader: View {
    var title: String
    
    var body: some View {
        Text(title)
            .frame(alignment: .leading)
            .font(.title2)
            .textCase(nil)
            .fontWeight(.bold)
            .foregroundStyle(.foreground)
    }
}

struct LinkButtonView: View {
    let link: String
    let label: String
    
    var body: some View {
        HStack {
            Link(destination: URL(string: link)!) {
                Text(label)
            }
            Spacer()
            Image(systemName: "safari")
                .foregroundStyle(.tertiary)
        }
    }
}
