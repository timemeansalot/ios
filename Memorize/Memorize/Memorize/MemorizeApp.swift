//
//  MemorizeApp.swift
//  Memorize
//
//  Created by fujie on 2022/7/7.
//

import SwiftUI

// @main measns it's the main app
@main
struct MemorizeApp: App {
    
    let game=EmojiMemoryGame() // a pointer which points to emoji object
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
