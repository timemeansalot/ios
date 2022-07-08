//
//  EmojiMemoryGame.swift
//  Memorize
//  This is ** View Model**
//  Created by fujie on 2022/7/8.
//

import SwiftUI


// use class instead of struct
class EmojiMemoryGame{
    
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
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
}
