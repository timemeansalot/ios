//
//  MemoryGame.swift
//  Memorize
//  This is ** Model **
//  Created by fujie on 2022/7/8.
//

import Foundation // for basic stuff like: Array, String and Dict, etc

// <CardContent> means don't-care type
struct MemoryGame<CardContent>{
    private(set) var cards: Array<Card>
    
    // card: Card is redundent, so we don't need to use label at this time
    func choose(_ card: Card) {
        
    }
    
    // init function for struct
    // createCardContent is a function which inputs an Int and outputs a CardContent, it's used to create a content which is used for initilize Card
    init(numberOfpairsOfCard: Int,createCardContent:(Int)->CardContent){
        cards=Array<Card>()
        
        for pairIndex in 0..<numberOfpairsOfCard{
            let content=createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))

        }
    }
    
    // define a Card which is used for the MemoryGame, so we declare thme right inside the struct MemoryGame
    struct Card{
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
