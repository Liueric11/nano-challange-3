//
//  SharedImageView.swift
//  nano-challenge-3
//
//  Created by Clarissa Alverina on 16/07/24.
//

import SwiftUI

struct SharedImageView: View {
    let secondsElapsed: Int
    let title: String
    let text: String
    
    var body: some View {
        VStack (spacing: 24) {
            ZStack {
                Rectangle()
                    .frame(width: 354, height: 101)
                    .foregroundColor(Color(UIColor.secondarySystemGroupedBackground))
                    .cornerRadius(10)
                
                VStack (alignment: .leading, spacing: 20) {
                    Text("Congratulations!")
                        .font(.system(size: 20))
                    
                    HStack (alignment: .firstTextBaseline) {
                        Text("\(secondsElapsed / 60)")
                            .fontWeight(.bold)
                            .font(.system(size: 22))
                            .foregroundColor(.indigo)
                        Text("mins reading")
                            .font(.system(size: 17))
                            .foregroundColor(Color(UIColor.secondaryLabel))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
            }
            
            ZStack {
                Rectangle()
                    .frame(width: 359, height: 546)
                    .foregroundColor(Color(UIColor.secondarySystemGroupedBackground))
                    .cornerRadius(10)
                
                VStack (alignment: .leading) {
                    Text(title)
                        .bold()
                        .font(.system(size: 22))
                    Text(text)
                }
                .frame(width: 330, height: 525, alignment: .topLeading)
                
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
    }
}

struct SharedImageView_Previews: PreviewProvider {
    static var previews: some View {
        SharedImageView(secondsElapsed: 120, title: "Sample Title", text: "This is a sample text.")
    }
}


