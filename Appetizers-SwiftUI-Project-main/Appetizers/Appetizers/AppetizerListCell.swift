//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by Ali Durna on 15.02.2024.
//

import SwiftUI

// 'AppetizerListCell' yapısı, yemek listesindeki her bir hücreyi temsil eder.
struct AppetizerListCell: View {
    
    // Hücrede gösterilecek yemek nesnesi.
    let appetizer: Appetizer
    
    var body: some View {
        // Hücre düzeni
        HStack {
            // Yemek görselini içeren ImageView
            Image("asian-flank-steak")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
            
            // Yemek adı ve fiyatını içeren VStack
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

// Önizleme yapısı, 'AppetizerListCell' hücresini önizler.
#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
}
