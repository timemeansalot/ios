//
//  ContentView.swift
//  Landmarks
//
//  Created by fujie on 2022/7/7.
//

import SwiftUI

// declare structure
struct ContentView: View {
    var body: some View {
        VStack (alignment:.leading){
            Text("Tutle Rock")
                .font(.title)
            
            HStack {
                Text("Joshua Tree National Park")
                    .font(.subheadline)
                Spacer()
                Text("California")
                    .font(.subheadline)
            }
            
        }
        .padding()
        
    }
}

// declare which view to show
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
