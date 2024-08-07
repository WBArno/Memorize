//
//  ContentView.swift
//  Memorize
//
//  Created by William Arnold on 8/6/24.
//

import SwiftUI

struct ContentView: View {
    let cardEmoji = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"]
    @State var cardCount = 4
    
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<cardCount, id: \.self) { index in
                    CardView(cardSymbol: cardEmoji[index])
                }
            } .foregroundColor(.orange)
            
            HStack {
                Button(
                    action: {if cardCount > 1 {cardCount -= 1}},
                    label: {
                        Image(systemName: "rectangle.stack.badge.minus.fill")
                            .imageScale(.large)
                            .font(.largeTitle)
                })
                Spacer()
                Button(
                    action: {if cardCount < cardEmoji.count {cardCount += 1}},
                    label: {
                        Image(systemName: "rectangle.stack.badge.plus.fill")
                            .imageScale(.large)
                            .font(.largeTitle)
                })
            }
        } .padding()
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
