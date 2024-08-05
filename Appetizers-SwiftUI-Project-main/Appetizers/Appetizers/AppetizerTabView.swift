//
//  ContentView.swift
//  Appetizers
//
//  Created by Ali Durna on 12.02.2024.
//  Hello World

import SwiftUI

// Ana sekme görünümünü temsil eden yapı.
struct AppetizerTabView: View {
    var body: some View {
        
        // TabView, ana ekranı oluşturan görünümleri içerir.
        TabView{
            // 'AppetizerListView' görünümü, "Home" sekmesini temsil eder.
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            // 'AccountView' görünümü, "Account" sekmesini temsil eder.
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            
            // 'OrderView' görünümü, "Order" sekmesini temsil eder.
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
        }
        .accentColor(Color("brandPrimary")) // TabView'in vurgu rengini ayarlar.
    }
}

// Önizleme yapısı, 'AppetizerTabView' görünümünü önizler.
#Preview {
    AppetizerTabView()
}
