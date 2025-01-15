//
//  WordView.swift
//  lipu lipu
//
//  Created by HPro2 on 1/9/25.
//

import SwiftUI

struct WordView: View {
    @Environment(\.colorScheme) var colorScheme
    let word: String
    let translations: String
    let source: String
    
    var body: some View {
        HStack {
            if colorScheme == .dark {
                Image(word)
                    .resizable()
                    .frame(width: 75, height: 75)
                    .padding(3)
            } else {
                Image(word)
                    .resizable()
                    .frame(width: 75, height: 75)
                    .padding(3)
                    .colorInvert()
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Text(word)
                        .font(.headline)
                    if colorScheme == .dark {
                        Image(source)
                            .resizable()
                            .frame(width: 25, height: 25)
                    } else {
                        Image(source)
                            .resizable()
                            .frame(width: 25, height: 25)
                            .colorInvert()
                    }
                }
                Text(translations)
                    .font(.subheadline)
            }
            .padding(.leading, 5)
            
            Spacer()
        }
    }
}
