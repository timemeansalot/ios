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
        LandmarkList()
    }
}


// declare a preview of the above view, just the preview on the right part. we can comment the out which will destroy the preview but will not influence the whole program when debug.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
