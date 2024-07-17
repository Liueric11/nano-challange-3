//
//  ShareView.swift
//  nano-challenge-3
//
//  Created by Clarissa Alverina on 16/07/24.
//

import SwiftUI

struct ShareView: View {
    @Binding var isPresented: Bool
    
    @State var sheet = false

    var body: some View {
        var items : [Any] = []
        
        VStack {
            SharedImageView()
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
                        guard let imageShared = ImageRenderer(content: SharedImageView()).uiImage else {
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
                    .sheet(isPresented: $sheet, content: {
                        ShareSheet(items: items)
                    })
                    
                    NavigationLink(destination: OnboardingView()) {
                        Text("Done")
                            .foregroundColor(.indigo)
                    }
                    
                }
            }
        }
    }
}

struct ShareSheet : UIViewControllerRepresentable {
    var items : [Any]
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: items, applicationActivities: nil)
        return controller
    }
}

