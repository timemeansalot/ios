//
//  EmojiMemoryGameView.swift
//  Memorize
// Version 1.1: Make multipy of rectangles
//  Created by fujie on 2022/7/7.
//

import SwiftUI // import UI stuffs


// below is the main code for Content
struct EmojiMemoryGameView: View {
    
    @ObservedObject var game: EmojiMemoryGame
        
    // variable: var
    var body: some View {
        ScrollView{
            LazyVGrid(columns:[GridItem(.adaptive(minimum: 80))]) {
                ForEach(game.cards){card in
                    CardView(card: card).aspectRatio(2/3,contentMode: .fit)
                        .onTapGesture {
                            game.choose(card)
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
    
    let card: EmojiMemoryGame.Card
    
    var body : some View{
            
        
        // use geometryReader to fit the picture inside the rectangle
        GeometryReader(content: {geometry in
                ZStack {
                    let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                    if card.isFaceUp{
                     // for rectangle fill
                        shape.fill().foregroundColor(.white)// for rectangle inside
                        shape.strokeBorder(lineWidth: DrawingConstants.lineWidth) // for rectangle boarder
                        Text(card.content).font(myFont(in: geometry.size))
                    } else if card.isMatched{
                        shape.opacity(0)
                    }else{
                        shape.fill()
                    }
              }
        })
    }
    
    private func myFont(in size: CGSize)->Font{
        Font.system(size: min(size.width,size.width)*DrawingConstants.fontScale)
    }
    
    
    // some contants used to make UI the way we want
    private struct DrawingConstants{
        static let cornerRadius: CGFloat=20
        static let lineWidth:CGFloat=3
        static let fontScale:CGFloat=0.8
    }
}






 










// below is only for preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game=EmojiMemoryGame()
//        ContentView()
//            .preferredColorScheme(.dark)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
    }
}
