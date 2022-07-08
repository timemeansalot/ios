//
//  ContentView.swift
//  Memorize
// Version 1.1: Make multipy of rectangles
//  Created by fujie on 2022/7/7.
//

import SwiftUI // import UI stuffs


// below is the main code for Content
struct ContentView: View {
    
    var emojis=["🚒","🚑","🛻","🚜","🛺","🚝","🚖","🚃",
                "🚁","🚀","🛳","🚢","🚤","🛰","🚇","🗼"]
    
    @State var emojiCount=8
    
    // variable: var
    var body: some View {
        
        VStack{
            ScrollView{
                LazyVGrid(columns:[GridItem(.adaptive(minimum: 80))]) {
                    ForEach(emojis[0..<emojiCount],id:\.self){
                        emoji in CardView(content: emoji).aspectRatio(2/3,contentMode: .fit)
                    }
                }
     
            }
            .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
            .foregroundColor(.red)
            Spacer()
            HStack{
                removeCard
                Spacer()
                addCard
                
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        
    }
    
    var removeCard: some View{
        Button(action: {
                if emojiCount>1{
                    emojiCount-=1
                }
            }, label: {
            Image(systemName: "minus.circle.fill")
        })
    }
    var addCard: some View{
        Button(action: {
            if emojiCount<emojis.count{
                emojiCount+=1}
            
        }, label: {
            Image(systemName: "plus.circle.fill")
        })
    }
}

struct CardView: View{
    
    // @State change isFaceUP into a pointer, so that it can be changed
    @State var isFaceUp: Bool=true // variables in Swift must have value, can't let empty
    var content:String
    
    var body : some View{
            ZStack {
                let shape = RoundedRectangle(cornerRadius: 25.0)
                if isFaceUp{
                 // for rectangle fill
                    shape.fill().foregroundColor(.white)// for rectangle inside
                    shape.strokeBorder(lineWidth: 3) // for rectangle boarder
                Text(content)
                    .font(.largeTitle)
                } else{
                    shape.fill()
                }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

















// below is only for preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()
//            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
