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
            Button(action: {
                guard let imageShared = ImageRenderer(content: SharedImageView()).uiImage else {
                    return
                }
                
                items.removeAll()
                items.append(imageShared)
        
                sheet.toggle()
                
            }) {
                Image(systemName: "square.and.arrow.up.fill")
                    .font(.system(size: 26))
                    .padding(.bottom, 300)
                    .padding(.leading, 250)
            }
            .sheet(isPresented: $sheet, content: {
                ShareSheet(items: items)
            })
            
            Text("modal view")
                .font(.system(size: 30))
                .padding(.bottom, 200)
            
            Button(action: {
                isPresented = false
            }) {
                Text("Dismiss")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
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
