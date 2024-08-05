//
//  APError.swift
//  Appetizers
//
//  Created by Ali Durna on 15.02.2024.
//

import Foundation

// 'APError' enum'u, ağ işlemleri sırasında oluşabilecek hata durumlarını temsil eder.
enum APError: Error {
    case invalidURL          // Geçersiz URL hatası
    case invalidResponse     // Geçersiz yanıt hatası
    case invalidData         // Geçersiz veri hatası
    case unableToComplete    // İşlem tamamlanamama hatası
}

