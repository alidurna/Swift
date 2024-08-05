//
//  BarcodeScannerViewModel.swift
//  BarcodeScanner
//
//  Created by Ali Durna on 11/5/20.
//

import SwiftUI

// BarcodeScannerViewModel sınıfı, SwiftUI uygulamasında barkod tarayıcısının durumunu yönetir.
final class BarcodeScannerViewModel: ObservableObject {
    
    // @Published özelliği, bu özelliğin değeri değiştiğinde gözlemcileri (observers) bilgilendirir.
    @Published var scannedCode = "" // Taranan barkodun depolandığı değişken
    
    @Published var alertItem: AlertItem? // Uyarıları göstermek için kullanılan değişken
    
    // Computed property, taranan kodun durumunu belirler
    var statusText: String {
        scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode
    }
    
    // Computed property, taranan kodun durumuna göre metin rengini belirler
    var statusTextColor: Color {
        scannedCode.isEmpty ? .red : .green
    }
}
