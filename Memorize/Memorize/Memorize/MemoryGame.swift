//
//  MemoryGame.swift
//  Memorize
//  This is ** Model **
//  Created by fujie on 2022/7/8.
//

import Foundation // for basic stuff like: Array, String and Dict, etc

// <CardContent> means don't-care type
// Equatable makes CardContent change from don't-care type into some type which can compare
struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? // optional type, init by nil in default
    
    // card: Card is redundent, so we don't need to use label at this time
    // mutating is used explicity say we want a function to mutate variables in struct.
    mutating func choose(_ card: Card) {
//        if let chosenIndex=index(of: card){
        if let chosenIndex = cards.firstIndex(where: {$0.id==card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched{
//            print(chosenIndex)
            if let potentialIndex=indexOfTheOneAndOnlyFaceUpCard{
                if cards[potentialIndex].content==cards[chosenIndex].content{
                    cards[potentialIndex].isMatched=true
                    cards[chosenIndex].isMatched=true
                }
                indexOfTheOneAndOnlyFaceUpCard=nil
            }else {
                for index in cards.indices{
                    cards[index].isFaceUp=false
                }
                indexOfTheOneAndOnlyFaceUpCard=chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    // use the method in Array, so we don't need to manually write the method below
//    func index(of card: Card)->Int?{
//        for index in 0..<cards.count{
//            if(cards[index].id==card.id){
//                return index
//            }
//        }
//        return nil
//    }
    
    // init function for struct
    // createCardContent is a function which inputs an Int and outputs a CardContent, it's used to create a content which is used for initilize Card
    init(numberOfpairsOfCard: Int,createCardContent:(Int)->CardContent){
        cards=Array<Card>()
        
        for pairIndex in 0..<numberOfpairsOfCard{
            let content=createCardContent(pairIndex)
            cards.append(Card(content: content,id: pairIndex*2))
            cards.append(Card(content: content,id:pairIndex*2+1))

        }
    }
    
    // define a Card which is used for the MemoryGame, so we declare thme right inside the struct MemoryGame
    struct Card: Identifiable{
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent // don't-care type
        var id: Int

    }
}
