//
//  EmojiMemoryGame.swift
//  Memorize
//  This is ** View Model** 
//  Created by fujie on 2022/7/8.
//

import SwiftUI


// use class instead of struct
// when model changes, re_render the UI
class EmojiMemoryGame: ObservableObject{
    
    static  let emojis=["🚒","🚑","🛻","🚜","🛺","🚝","🚖","🚃",
                "🚁","🚀","🛳","🚢","🚤","🛰","🚇","🗼"]
    static func createMemoryGame()->MemoryGame<String>{
        MemoryGame<String>(numberOfpairsOfCard: 4){
            pairIndex in emojis[pairIndex]
        }
    }
    
    // private: only the EmojiMemoryGame can see the model variable
    // private(set): other class can see the model variable, but can't change it
//    private var model: MemoryGame<String>=MemoryGame<String>(numberOfpairsOfCard: 4){ pairIndex in
//        emojis[pairIndex]
//    }
    // the @Published keyword is used  to re_rerender the UI when model changes 
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    // MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card){
//        objectWillChange.send() // re_render UI when object change
        model.choose(card)
    }
}
