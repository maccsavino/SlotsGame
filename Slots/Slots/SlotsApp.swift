//
//  SlotsApp.swift
//  Slots
//
//  Created by Kevin Savinovich on 4/5/23.
//

import SwiftUI

@main
struct SlotsApp: App {
    let game = ModelOfTheView()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
