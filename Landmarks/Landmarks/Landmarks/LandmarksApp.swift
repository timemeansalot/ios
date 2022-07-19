//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 付杰 on 2022/7/15.
//

import SwiftUI

@main // the main mark the entry point of the program
struct LandmarksApp: App {
    @StateObject private var modelData=ModelData() // create an object and init it.
    
    
    var body: some Scene { // provide content for display
        WindowGroup {
            ContentView()
                .environmentObject(modelData) // pass the modelData to child views.
        }
    }
}
