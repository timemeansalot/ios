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
    
//    version 1.0: private var indexOfTheOneAndOnlyFaceUpCard: Int? // optional type, init by nil in default
    // version 1.1: calculate the indexOfTheOneAndOnlyFaceUpCard
//    private var indexOfTheOneAndOnlyFaceUpCard: Int?{
//        get{
//            var faceUpIndices=[Int]()
//            for index in cards.indices{
//                if cards[index].isFaceUp{
//                    faceUpIndices.append(index)
//                }
//            }
//            if faceUpIndices.count==1{
//                return faceUpIndices[0] // there is one value in faceUpIndices, return it
//            }else {
//                return nil // there is nothing in faceUpIndices, means no card is face up, return nil
//            }
//        }
//        set{
//            for index in cards.indices{
//                if index != newValue{
//                    cards[index].isFaceUp=false
//                }else {
//                    cards[index].isFaceUp=true
//                }
//            }
//        }
//    }
    // version 1.2: function programming to minimize codes
    private var indexOfTheOneAndOnlyFaceUpCard: Int?{
        get{cards.indices.filter({cards[$0].isFaceUp}).oneAndOnly}
        set{cards.indices.forEach{cards[$0].isFaceUp=($0==newValue)}}
    }
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
                cards[chosenIndex].isFaceUp=true
            }else {
                indexOfTheOneAndOnlyFaceUpCard=chosenIndex
            }
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
        cards=[]
        
        for pairIndex in 0..<numberOfpairsOfCard{
            let content=createCardContent(pairIndex)
            cards.append(Card(content: content,id: pairIndex*2))
            cards.append(Card(content: content,id:pairIndex*2+1))

        }
    }
    
    // define a Card which is used for the MemoryGame, so we declare thme right inside the struct MemoryGame
    struct Card: Identifiable{
        
        var isFaceUp = false
        var isMatched = false
        let content: CardContent // don't-care type
        let id: Int

    }
}
 

// extension for Array, so we add a variable called oneAndOnly into Array
extension Array{
    var oneAndOnly: Element?{
        if self.count==1{
            return first
        }else {
            return nil
        }
    }
}
