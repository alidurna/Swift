//
//  AccountView.swift
//  Appetizers
//
//  Created by Ali Durna on 12.02.2024.
//

import SwiftUI

// 'AccountView' yapısı, kullanıcının hesap bilgilerini gösteren görünümü temsil eder.
struct AccountView: View {
    var body: some View {
        // NavigationView içindeki metin görünümü
        NavigationView {
            Text("Account") // Hesap bilgilerini gösteren metin
                .navigationTitle("🧝🏼‍♂️ Account") // Sayfanın başlığını belirler.
        }
    }
}

// Önizleme yapısı, 'AccountView' görünümünü önizler.
#Preview {
    AccountView()
}
