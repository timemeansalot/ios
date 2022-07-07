//
//  ContentView.swift
//  Memorize
//
//  Created by fujie on 2022/7/7.
//

import SwiftUI // import UI stuffs


// below is the main code for Content
struct ContentView: View {
    
    // variable: var
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .stroke(lineWidth: 3)
            
            Text("Hello Word").foregroundColor(.orange)
        }
        .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
        .foregroundColor(.blue)


    }
}


















// below is only for preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
