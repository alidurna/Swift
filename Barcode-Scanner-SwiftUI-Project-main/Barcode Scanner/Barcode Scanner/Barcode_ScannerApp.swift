//
//  Barcode_ScannerApp.swift
//  Barcode Scanner
//
//  Created by Ali Durna on 25.01.2024.
//

import SwiftUI

// Barcode_ScannerApp, uygulamanın giriş noktasını temsil eden bir SwiftUI App yapısıdır.
@main
struct Barcode_ScannerApp: App {
    
    // body, uygulamanın ana sahnesini ve başlangıç noktasını belirler.
    var body: some Scene {
        // WindowGroup, uygulamanın ana penceresini temsil eden bir SwiftUI sahnesi oluşturur.
        WindowGroup {
            // BarcodeScannerView, uygulamanın ana içeriğini temsil eden bir SwiftUI görünümüdür.
            BarcodeScannerView()
        }
    }
}
