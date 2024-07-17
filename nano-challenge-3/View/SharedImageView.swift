//
//  SharedImageView.swift
//  nano-challenge-3
//
//  Created by Clarissa Alverina on 16/07/24.
//

import SwiftUI

struct SharedImageView: View {
    var body: some View {
        VStack (spacing: 24){
            ZStack {
                Rectangle()
                    .frame(width: 354, height: 101)
                    .foregroundColor(Color(UIColor.secondarySystemGroupedBackground))
                    .cornerRadius(10)
                
                VStack (alignment: .leading, spacing: 20){
                    Text("Congratulations!")
                        .font(.system(size: 20))
                    
                    HStack (alignment: .firstTextBaseline){
                        Text("10")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 22))
                            .foregroundColor(.indigo)
                        Text("mins reading")
                            .font(.system(size: 17))
                            .foregroundColor(Color(UIColor.secondaryLabel))
                    }
                } 
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 33)
            }
            
            ZStack {
                Rectangle()
                    .frame(width: 359, height: 546)
                    .foregroundColor(Color(UIColor.secondarySystemGroupedBackground))
                    .cornerRadius(10)
                
                Text("Jika diumpamakan sekeping koin tidak bisa menjadikan kaya, suatu perubahan positif seperti meditasi selama satu menit. When you fall in love with the process rather than the product, you don’t have to wait to give yourself permission to be happy. You can be satisfied anytime your system is running. And a system can be successful in many different forms, not just the one you first envision. Pada umumnya, perubahan-perubahan kecil seringkali terkesan tak bermakna karena tidak langsung membawa perubahan nyata pada hidup suatu manusia.")
                    .frame(width: 330, height: 525, alignment: .topLeading)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
    }
}

#Preview {
    SharedImageView()
}
