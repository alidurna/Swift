//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Ali Durna
//

import SwiftUI

// ScannerView, UIViewControllerRepresentable protokolünü uygulayan bir yapıdır.
struct ScannerView: UIViewControllerRepresentable {
    
    // Binding ile bağlanan girişler: taranan kod ve alert öğesi
    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem?
    
    // UIViewControllerRepresentable protokolünün gerektirdiği metotlar
    
    // UIViewController'ı oluşturur
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    // UIViewController güncellenirse
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {}
    
    // Coordinator (koordinatör) oluşturur
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }
    
    // ScannerView ile ilişkilendirilmiş Coordinator sınıfı
    final class Coordinator: NSObject, ScannerVCDelegate {
        
        private let scannerView: ScannerView
        
        // Coordinator'ı başlatır
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
        
        // Tarayıcı bir barkod bulduğunda çağrılır
        func didFind(barcode: String) {
            scannerView.scannedCode = barcode
        }
        
        // Kamera hatası ortaya çıktığında çağrılır
        func didSurface(error: CameraError) {
            // Hata tipine göre uygun AlertItem atanır
            switch error {
            case .invalidDeviceInput:
                scannerView.alertItem = AlertContext.invalidDeviceInput
            case .invalidScannedValue:
                scannerView.alertItem = AlertContext.invalidScannedType
            }
        }
    }
}
