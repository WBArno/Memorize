//
//  ContentView.swift
//  Memorize
//
//  Created by William Arnold on 8/6/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let cardBase = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp {
                cardBase.fill(.white)
                cardBase.strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            } else {cardBase}
        }.onTapGesture {isFaceUp.toggle()}
    }
}




#Preview {
    ContentView()
}
