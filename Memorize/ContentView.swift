//
//  ContentView.swift
//  Memorize
//
//  Created by William Arnold on 8/6/24.
//

import SwiftUI

struct ContentView: View {
    let cardEmoji = ["👻", "🎃", "🕷️", "😈"]
    
    var body: some View {
        HStack {
            ForEach(cardEmoji.indices, id: \.self) { index in
                CardView(cardSymbol: cardEmoji[index])
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUp = false
    let cardSymbol: String
    
    var body: some View {
        ZStack {
            let cardBase = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp {
                cardBase.fill(.white)
                cardBase.strokeBorder(lineWidth: 2)
                Text(cardSymbol).font(.largeTitle)
            } else {cardBase}
        }.onTapGesture {isFaceUp.toggle()}
    }
}




#Preview {
    ContentView()
}
