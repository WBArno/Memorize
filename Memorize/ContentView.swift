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
            ScrollView{cards}
            Spacer()
            cardCountAdjusters
        } .padding()
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(
            action: {cardCount += offset},
            label: {
                Image(systemName: symbol)
                    .imageScale(.large)
                    .font(.largeTitle)
            }).disabled(cardCount + offset < 1 || cardCount + offset > cardEmoji.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder : some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum:120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(cardSymbol: cardEmoji[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        } .foregroundColor(.orange)
    }
    
    var cardCountAdjusters: some View {
        HStack {

            cardRemover
            Spacer()
            cardAdder
        }
    }
}

struct CardView: View {
    @State var isFaceUp = false
    let cardSymbol: String
    
    var body: some View {
        ZStack {
            let cardBase = RoundedRectangle(cornerRadius: 12)
            Group {
                cardBase.fill(.white)
                cardBase.strokeBorder(lineWidth: 2)
                Text(cardSymbol).font(.largeTitle)
            } .opacity(isFaceUp ? 1 : 0)
            cardBase.fill().opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {isFaceUp.toggle()}
    }
}




#Preview {
    ContentView()
}
