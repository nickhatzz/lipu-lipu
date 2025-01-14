//
//  wordCellView.swift
//  lipu lipu
//
//  Created by HPro2 on 1/9/25.
//

import SwiftUI

struct wordCellView: View {
    @Environment(\.colorScheme) var colorScheme
    let word: Word
    
    var body: some View {
        HStack {
            if colorScheme == .dark {
                Image(word.name)
                    .resizable()
                    .frame(width: 75, height: 75)
                    .padding(3)
            } else {
                Image(word.name)
                    .resizable()
                    .frame(width: 75, height: 75)
                    .padding(3)
                    .colorInvert()
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Text(word.name)
                        .font(.headline)
                    if colorScheme == .dark {
                        Image(word.source)
                            .resizable()
                            .frame(width: 25, height: 25)
                    } else {
                        Image(word.source)
                            .resizable()
                            .frame(width: 25, height: 25)
                            .colorInvert()
                    }
                }
                Text(word.translations)
                    .font(.subheadline)
            }
            .padding(.leading, 5)
            
            Spacer()
        }
    }
}
