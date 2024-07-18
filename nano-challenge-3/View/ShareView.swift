//
//  ShareView.swift
//  nano-challenge-3
//
//  Created by Clarissa Alverina on 16/07/24.
//

import SwiftUI

struct ShareView: View {
    let secondsElapsed: Int
    let title: String
    let text: String
    
    @State private var sheet = false
    @State private var items: [Any] = []
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            SharedImageView(secondsElapsed: secondsElapsed, title: title, text: text)
                .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Preview")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                
                Button {
                    guard let imageShared = ImageRenderer(content: SharedImageView(secondsElapsed: secondsElapsed, title: title, text: text)).uiImage else {
                        return
                    }

                    items.removeAll()
                    items.append(imageShared)
                    sheet.toggle()
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.indigo)
                }
    
                NavigationLink(destination: OnboardingView()) {
                    Text("Done")
                        .foregroundColor(.indigo)
                }
            }
        }
        .sheet(isPresented: $sheet) {
            ShareSheet(items: items)
        }
    }
}

struct ShareSheet: UIViewControllerRepresentable {
    var items: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        return UIActivityViewController(activityItems: items, applicationActivities: nil)
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        // No updates needed
    }
}

#Preview {
    NavigationStack{
        ShareView(secondsElapsed: 120, title: "Sample Title", text: "This is a sample text.")
    }
}

