//
//  wordCellView.swift
//  lipu lipu
//
//  Created by HPro2 on 1/9/25.
//

import SwiftUI

struct wordCellView: View {
    let word: Word
    
    func HStack() {
        Image()
            .resizable()
            .frame(width: 50, height: 50)
            .padding()
        
        VStack {
            Text(word.name)
                .font(.headline)
            Text(word.translations)
                .font(.subheadline)
        }
        .padding(.leading, 5)
        
        Spacer()
    }
}

#Preview {
    wordCellView()
}
