//
//  BottomNavBar.swift
//  nano-challenge-3
//
//  Created by Clarissa Alverina on 15/07/24.
//

import SwiftUI

struct BottomNavBar: View {
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "folder.badge.plus")
            Spacer()
            // NavigationLink(destination: NoteView()) {
            //     Image(systemName: "square.and.pencil")
            // }
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
