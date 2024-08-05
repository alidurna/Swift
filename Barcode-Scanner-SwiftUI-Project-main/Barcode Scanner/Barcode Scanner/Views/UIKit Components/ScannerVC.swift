//
//  ScannerVC.swift
//  BarcodeScanner
//
//  Created by Ali Durna on 11/5/20.
//

import UIKit
import AVFoundation

// Kamera ile ilgili hataları belirten enum
enum CameraError {
    case invalidDeviceInput
    case invalidScannedValue
}

// ScannerVCDelegate, ScannerVC tarafından uygulanan protokol
// Bu protokol, ScannerVC'nin tarayıcıdan gelen verileri ve hataları işlemesini sağlar.
protocol ScannerVCDelegate: AnyObject {
    func didFind(barcode: String)
    func didSurface(error: CameraError)
}

// ScannerVC sınıfı, kamera görüntülerini yakalar ve barkodları tespit eder.
final class ScannerVC: UIViewController {
    
    // AVCaptureSession, kameradan video yakalamak için kullanılır.
    let captureSession = AVCaptureSession()
    var previewLayer: AVCaptureVideoPreviewLayer?
    
    // Scanner ile iletişim kuran zayıf referanslı bir delegaet
    weak var scannerDelegate: ScannerVCDelegate?
    
    // Başlatıcı metodu - ScannerVCDelegate'ini alır
    init(scannerDelegate: ScannerVCDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.scannerDelegate = scannerDelegate
    }
    
    // Storyboard veya XIB dosyalarından yüklenirken çağrılır, ancak burada kullanılmıyor.
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // UIViewController yaşam döngüsü metodu: ViewController yüklenir yüklenmez çağrılır.
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCaptureSession()
    }
    
    // UIViewController yaşam döngüsü metodu: ViewController'nin alt öğeleri düzenlendikten sonra çağrılır.
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Eğer önizleme katmanı mevcut değilse, invalidDeviceInput hatası bildirilir.
        guard let previewLayer = previewLayer else {
            scannerDelegate?.didSurface(error: .invalidDeviceInput)
            return
        }
        
        // Preview layer'ın boyutu View'ın boyutuna ayarlanır.
        previewLayer.frame = view.layer.bounds
    }
    
    // AVCaptureSession'ı kurma metodu
    private func setupCaptureSession() {
        // Video yakalama cihazını al
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
            // Eğer cihaz alınamazsa invalidDeviceInput hatası bildirilir.
            scannerDelegate?.didSurface(error: .invalidDeviceInput)
            return
        }
        
        // Video girişini oluştur
        let videoInput: AVCaptureDeviceInput
        do {
            try videoInput = AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            // Video girişi oluşturulamazsa invalidDeviceInput hatası bildirilir.
            scannerDelegate?.didSurface(error: .invalidDeviceInput)
            return
        }
        
        // Video girişini ekleyebilirsek ekleyelim
        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        } else {
            // Video girişi eklenemezse invalidDeviceInput hatası bildirilir.
            scannerDelegate?.didSurface(error: .invalidDeviceInput)
            return
        }
        
        // Metadata çıktısını oluştur
        let metaDataOutput = AVCaptureMetadataOutput()
        
        // Metadata çıktısını ekleyebilirsek ekleyelim
        if captureSession.canAddOutput(metaDataOutput) {
            captureSession.addOutput(metaDataOutput)
            metaDataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metaDataOutput.metadataObjectTypes = [.ean8, .ean13]
        } else {
            // Metadata çıktısı eklenemezse invalidDeviceInput hatası bildirilir.
            scannerDelegate?.didSurface(error: .invalidDeviceInput)
            return
        }
        
        // Preview layer'ı oluştur
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer!.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer!)
        
        // Kamera görüntülerini yakalamaya başla
        captureSession.startRunning()
    }
}

// AVCaptureMetadataOutputObjectsDelegate protokolünü uygulayan extension
extension ScannerVC: AVCaptureMetadataOutputObjectsDelegate {
    
    // Metadata çıktılarından gelen verileri işleme metodu
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        // Eğer bir obje varsa
        guard let object = metadataObjects.first else {
            // Eğer obje yoksa invalidScannedValue hatası bildirilir.
            scannerDelegate?.didSurface(error: .invalidScannedValue)
            return
        }
        
        // Eğer obje bir AVMetadataMachineReadableCodeObject ise
        guard let machineReadableObject = object as? AVMetadataMachineReadableCodeObject else {
            // Eğer obje AVMetadataMachineReadableCodeObject değilse invalidScannedValue hatası bildirilir.
            scannerDelegate?.didSurface(error: .invalidScannedValue)
            return
        }
        
        // Eğer bir barkod değeri varsa
        guard let barcode = machineReadableObject.stringValue else {
            // Eğer barkod değeri yoksa invalidScannedValue hatası bildirilir.
            scannerDelegate?.didSurface(error: .invalidScannedValue)
            return
        }
        
        // Delegaet üzerinden bulunan barkodu bildir
        scannerDelegate?.didFind(barcode: barcode)
    }
}
