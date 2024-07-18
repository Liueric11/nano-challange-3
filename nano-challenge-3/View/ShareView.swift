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
    
    var body: some View {
        VStack {
            SharedImageView(secondsElapsed: secondsElapsed, title: title, text: text)
                .padding()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Text("Preview")
                        .font(.headline)
                        .padding(.leading, 170)
                    Spacer()
                    
                    Button(action: {
                        guard let imageShared = ImageRenderer(content: SharedImageView(secondsElapsed: secondsElapsed, title: title, text: text)).uiImage else {
                            return
                        }
                        
                        items.removeAll()
                        items.append(imageShared)
                        sheet.toggle()
                    }) {
                        Image(systemName: "square.and.arrow.up")
                            .padding(.leading, 10)
                            .padding(.bottom, 3)
                            .foregroundColor(.indigo)
                    }
                    .sheet(isPresented: $sheet) {
                        ShareSheet(items: items)
                    }
                    
                    NavigationLink(destination: OnboardingView()) {
                        Text("Done")
                            .foregroundColor(.indigo)
                    }
                }
            }
        }
        .navigationBarTitle("Preview")
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

struct ShareView_Previews: PreviewProvider {
    static var previews: some View {
        ShareView(secondsElapsed: 120, title: "Sample Title", text: "This is a sample text.")
    }
}
