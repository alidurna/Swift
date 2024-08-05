//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Ali Durna on 11/5/20.
//

import SwiftUI

// BarcodeScannerView, SwiftUI tarafından oluşturulan bir görünümdür.
struct BarcodeScannerView: View {
    
    // BarcodeScannerViewModel, bu görünümün veri modelidir.
    @StateObject var viewModel = BarcodeScannerViewModel()
    
    var body: some View {
        // NavigationView, uygulamada gezinme barı sağlar.
        NavigationView {
            // VStack, dikey bir düzen sağlar, içindeki bileşenleri üstten alta sıralar.
            VStack {
                // ScannerView, kamera tarafından taranan kodu gösteren bir bileşendir.
                ScannerView(scannedCode: $viewModel.scannedCode,
                            alertItem: $viewModel.alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                // Boşluk ekleyerek dikey konumlamayı ayarlar.
                Spacer().frame(height: 60)
                
                // Label, metin ve sembol içeren bir etiket oluşturur.
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                // Text, metin göstermek için kullanılır.
                Text(viewModel.statusText)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(viewModel.statusTextColor)
                    .padding()
            }
            // navigationTitle, NavigationView'un üst çubuğunda görünen başlığı ayarlar.
            .navigationTitle("Barcode Scanner")
            
            // alert, viewModel içindeki alertItem'i takip eder ve eğer varsa bir uyarı penceresi gösterir.
            .alert(item: $viewModel.alertItem) { alertItem in
                // Alert, kullanıcıya bilgi vermek veya ondan bir eylem istemek için kullanılır.
                Alert(
                    title: Text(alertItem.title),
                    message: Text(alertItem.message),
                    dismissButton: alertItem.dismissButton
                )
            }
        }
    }
}

// ContentView_Previews, bu görünümün önizlemesini sağlar.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BarcodeScannerView()
    }
}
