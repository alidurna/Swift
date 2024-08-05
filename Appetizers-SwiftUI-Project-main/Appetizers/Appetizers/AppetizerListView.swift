//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Ali Durna on 12.02.2024.
//

import SwiftUI

// 'AppetizerListView' yapısı, uygulamanın ana yemek listesini gösteren görünümü temsil eder.
struct AppetizerListView: View {
    
    // Yemek listesini tutacak olan değişken.
    @State private var appetizers: [Appetizer] = []
    
    var body: some View {
        NavigationView {
            // Yemek listesini gösteren 'List' yapısı.
            List(MockData.appetizers) { appetizer in
                // Her bir yemeği temsil eden 'AppetizerListCell' hücresini kullanır.
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle("🍟 Appetizers") // Sayfanın başlığını belirler.
        }
        .onAppear {
            getAppetizers() // Görünüm ilk kez görüntülendiğinde yemek listesini alma fonksiyonunu çağırır.
        }
    }
    
    // NetworkManager ile yemek listesini almak için kullanılan fonksiyon.
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

// Önizleme yapısı, 'AppetizerListView' görünümünü önizler.
#Preview {
    AppetizerListView()
}

