//
//  NoteView.swift
//  nano-challenge-3
//
//  Created by Clarissa Alverina on 16/07/24.
//

import SwiftUI

struct NoteView: View {
    @State private var isModalPresented = false

    var body: some View {
        VStack {
            Button(action: {
                isModalPresented.toggle()
            }) {
                Text("Show Modal")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .sheet(isPresented: $isModalPresented) {
            ShareView(isPresented: $isModalPresented)
        }
    }
}


#Preview {
    NoteView()
}
