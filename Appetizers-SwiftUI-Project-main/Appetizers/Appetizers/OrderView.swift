//
//  OrderView.swift
//  Appetizers
//
//  Created by Ali Durna on 12.02.2024.
//

import SwiftUI

// 'OrderView' yapısı, kullanıcının siparişlerini gösteren görünümü temsil eder.
struct OrderView: View {
    var body: some View {
        // NavigationView içindeki metin görünümü
        NavigationView {
            Text("Orders") // Siparişleri gösteren metin
                .navigationTitle("🧾 Orders") // Sayfanın başlığını belirler.
        }
    }
}

// Önizleme yapısı, 'OrderView' görünümünü önizler.
#Preview {
    OrderView()
}

