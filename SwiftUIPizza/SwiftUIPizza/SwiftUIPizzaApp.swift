//
//  SwiftUIPizzaApp.swift
//  SwiftUIPizza
//
//  Created by Lucas C Barros on 2024-07-25.
//

import SwiftUI

@main
struct SwiftUIPizzaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(menu: MenuModel().menu)
        }
    }
}
