//
//  AppleFrameworksSwiftUIApp.swift
//  AppleFrameworksSwiftUI
//
//  Created by Ali Durna on 14.01.2024.
//

import SwiftUI

@main
struct AppleFrameworksSwiftUIApp: App {
    var body: some Scene {
        // Ana pencere grubunu belirliyoruz.
        WindowGroup {
            // FrameworkGridView yapısını ana içerik olarak kullanıyoruz.
            FrameworkGridView()
        }
    }
}

