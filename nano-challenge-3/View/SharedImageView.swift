//
//  SharedImageView.swift
//  nano-challenge-3
//
//  Created by Clarissa Alverina on 16/07/24.
//

import SwiftUI

struct SharedImageView: View {
    var body: some View {
        VStack {
            Text("ini view yang dishare")
                .foregroundColor(.black)
                .padding()
            Text("ini view yang dishare")
                .foregroundColor(.black)
                .padding()
            Text("ini view yang dishare")
                .foregroundColor(.black)
                .padding()
            Text("ini view yang dishare")
                .foregroundColor(.black)
                .padding()
        }
        .background(.gray)
    }
}

#Preview {
    SharedImageView()
}
