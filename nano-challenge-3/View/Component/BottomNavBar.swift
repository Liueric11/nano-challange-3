//
//  BottomNavBar.swift
//  nano-challenge-3
//
//  Created by Clarissa Alverina on 15/07/24.
//

import SwiftUI

struct BottomNavBar: View {
    @State private var isModalPresented = false
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "folder.badge.plus")
            Spacer()
            NavigationLink(destination: ShareView(isPresented: $isModalPresented)) {
                 Image(systemName: "square.and.pencil")
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 0)
        .foregroundColor(.indigo)
        .font(.system(size: 20))
    }
}

#Preview {
    BottomNavBar()
}
