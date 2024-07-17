//
//  RedesignNoteView.swift
//  nano-challenge-3
//
//  Created by Clarissa Alverina on 17/07/24.
//

import SwiftUI

struct RedesignNoteView: View {
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text("Reading Time")
                    .font(.system(size: 16))
                Text("00.00")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
            }
        }
    }
}

#Preview {
    RedesignNoteView()
}
