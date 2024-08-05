//
//  Alert.swift
//  BarcodeScanner
//
//  Created by Ali Durna on 11/5/20.
//

import SwiftUI

// AlertItem adlı bir yapı tanımlanıyor, bu yapı Identifiable protokolünü uyguluyor.
struct AlertItem: Identifiable {
    let id = UUID()  // Her AlertItem bir benzersiz UUID'ye sahiptir.
    let title: String  // Alert başlığı
    let message: String  // Alert mesajı
    let dismissButton: Alert.Button  // Alert'ta görünen kapatma (dismiss) düğmesi
}

// AlertContext adlı bir yapı tanımlanıyor, bu yapı içinde önceden tanımlanmış bazı AlertItem'ları içerir.
struct AlertContext {
    // Kamera girişiyle ilgili bir sorun olduğunda gösterilecek AlertItem
    static let invalidDeviceInput = AlertItem(
        title: "Invalid Device Input",
        message: "Something is wrong with the camera. We are unable to capture the input.",
        dismissButton: .default(Text("OK"))  // "OK" düğmesi ile kapatılabilir
    )
    
    // Taranan değerin geçerli olmadığı durumda gösterilecek AlertItem
    static let invalidScannedType = AlertItem(
        title: "Invalid Scan Type",
        message: "The value scanned is not valid. This app scans EAN-8 and EAN-13.",
        dismissButton: .default(Text("OK"))  // "OK" düğmesi ile kapatılabilir
    )
}
