//
//  ContentView.swift
//  Landmarks
//
//  Created by 付杰 on 2022/7/15.
//

import SwiftUI

// define the view windows, which we will use in our program
struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .ignoresSafeArea(edges: .top) // allow the map to extend the top edge
                .frame(height: 300) // when don't specify the width parameter, it will use all the width available
            
            CircleImage()
                .offset(y:-130) // move the image upward
                .padding(.bottom,-130)
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title) // this is modifier which wrap a view to change its display
                HStack {
                    Text("Joshua Tree National Park")
                    Spacer()
                    Text("California")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                Text("About turtle rock")
                    .font(.title2)
                Text("Description Text goes here.")
            }
            .padding()
            
            Spacer() // add spacer at botton to push the text upward
        }
        // `command click` the Text or the view on the right, we can pop up the UI modify interface
    }
}


// declare a preview of the above view, just the preview on the right part. we can comment the out which will destroy the preview but will not influence the whole program when debug.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
