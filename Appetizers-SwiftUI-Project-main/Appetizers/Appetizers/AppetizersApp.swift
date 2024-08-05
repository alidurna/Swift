//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Ali Durna on 12.02.2024.
//

import SwiftUI

// Uygulamanın ana giriş noktası olan 'App' yapısını belirten dosya.

@main
struct AppetizersApp: App {
    var body: some Scene {
        // Uygulamanın temel sahnesini tanımlayan 'Scene' yapısı.
        WindowGroup {
            // Ana pencerenin içeriği olarak 'AppetizerTabView' kullanılıyor.
            AppetizerTabView()
        }
    }
}

