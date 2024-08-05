//
//  Appetizer.swift
//  Appetizers
//
//  Created by Ali Durna on 14.02.2024.
//

import Foundation

// 'Appetizer' yapısı, yemek bilgilerini içeren bir modeldir.
struct Appetizer: Decodable, Identifiable {
    let id: Int         // Yemek kimliği
    let name: String    // Yemek adı
    let description: String // Yemek açıklaması
    let price: Double   // Yemek fiyatı
    let imageURL: String // Yemek resim URL'si
    let calories: Int   // Yemek kalori değeri
    let protein: Int    // Yemek protein değeri
    let carbs: Int      // Yemek karbonhidrat değeri
}

// 'AppetizerResponse' yapısı, API'den gelen yanıtı temsil eder.
struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

// 'MockData' yapısı, uygulama geliştirilirken kullanılmak üzere örnek yemek verilerini içerir.
struct MockData {
    static let sampleAppetizer = Appetizer(id: 0001,
                                           name: "Test Appetizer",
                                           description: "This is the description for my appetizer. It's yummy.",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    // Örnek yemek listesi
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
