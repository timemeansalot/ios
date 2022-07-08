//
//  ContentView.swift
//  Memorize
// Version 1.1: Make multipy of rectangles
//  Created by fujie on 2022/7/7.
//

import SwiftUI // import UI stuffs


// below is the main code for Content
struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
        
    // variable: var
    var body: some View {
        ScrollView{
            LazyVGrid(columns:[GridItem(.adaptive(minimum: 80))]) {
                ForEach(viewModel.cards){card in
                    CardView(card: card).aspectRatio(2/3,contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
        .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
        .foregroundColor(.red)
    }
}

struct CardView: View{
    
//    // @State change isFaceUP into a pointer, so that it can be changed
//    @State var isFaceUp: Bool=true // variables in Swift must have value, can't let empty
//    var content:String
    
    let card: MemoryGame<String>.Card
    
    var body : some View{
            ZStack {
                let shape = RoundedRectangle(cornerRadius: 25.0)
                if card.isFaceUp{
                 // for rectangle fill
                    shape.fill().foregroundColor(.white)// for rectangle inside
                    shape.strokeBorder(lineWidth: 3) // for rectangle boarder
                    Text(card.content)
                    .font(.largeTitle)
                } else if card.isMatched{
                    shape.opacity(0)
                }else{
                    shape.fill()
                }
        }
    }
}






 










// below is only for preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game=EmojiMemoryGame()
//        ContentView()
//            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
