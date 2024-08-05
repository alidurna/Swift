//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Ali Durna on 12.01.2024.
//

import SwiftUI

// WeatherButton adında bir SwiftUI View yapısı oluşturulur.
struct WeatherButton: View {
    
    // WeatherButton yapısının özellikleri tanımlanır.
    var title: String           // Düğme üzerinde görüntülenecek metin.
    var textColor : Color       // Metin rengi.
    var backgroundColor : Color // Düğme arkaplan rengi.
    
    // View yapısının içeriğini tanımlayan body bloğu.
    var body: some View {
        
        // VStack, dikey bir düzen oluşturmak için kullanılır.
        VStack(spacing:20){
            
            // Text ile düğme üzerindeki metin eklenir.
            Text(title)
                .bold()                             // Metni kalın yapar.
                .frame(width: 280, height: 50)     // Düğme boyutu belirlenir.
                .background(backgroundColor)       // Düğmenin arkaplan rengi belirlenir.
                .cornerRadius(10)                   // Düğmenin köşe yuvarlatma değeri belirlenir.
        }
        .foregroundColor(textColor)                // Düğme metin rengi belirlenir.
    }
}

// WeatherButton yapısının önizlemesini sağlayan bir PreviewProvider yapısı oluşturulur.
struct WeatherButton_Previews: PreviewProvider {
    static var previews: some View {
        // Önizleme, örnek bir WeatherButton nesnesini içerir.
        WeatherButton(title: "Test Title", textColor: .white, backgroundColor: .blue)
    }
}

