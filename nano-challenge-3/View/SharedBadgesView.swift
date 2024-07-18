//
//  SharedBadgesView.swift
//  nano-challenge-3
//
//  Created by Clarissa Alverina on 16/07/24.
//

import SwiftUI


struct ShareBadges: View {
    @Binding var isBadgeModalPresented: Bool
    
    @State var sheet = false

    var body: some View {
        var items : [Any] = []
        VStack {
            ZStack {
                BadgesPhotoView()
                
                Button(action: {
                    guard let imageShared = ImageRenderer(content: BadgesPhotoView()).uiImage else {
                        return
                    }
                    
                    items.removeAll()
                    items.append(imageShared)
                    
                    sheet.toggle()
                    
                }) {
                    Image(systemName: "square.and.arrow.up")
                        .font(.system(size: 24))
                        .padding(.bottom, 650)
                        .padding(.leading, 320)
                }
                .sheet(isPresented: $sheet, content: {
                    ShareBadgesSheet(items: items)
                })
                
                
                //            Button(action: {
                //                isBadgeModalPresented = false
                //            }) {
                //                Text("Dismiss")
                //                    .font(.title)
                //                    .padding()
                //                    .background(Color.blue)
                //                    .foregroundColor(.white)
                //                    .cornerRadius(10)
                //            }
                
            }
        }
        .padding()
        .foregroundColor(Color(UIColor.secondaryLabel))
    }
}

struct ShareBadgesSheet : UIViewControllerRepresentable {
    var items : [Any]
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: items, applicationActivities: nil)
        return controller
    }
}


struct BadgesPhotoView: View {
    @ObservedObject var viewModel = BadgesViewModel()
    
    var body: some View {
        VStack {
            Image("")
            Image(systemName: viewModel.badgeItems[safe: 0]?.imageName ?? "")
                .opacity(viewModel.badgeItems[safe: 0]?.opacity ?? 0)
                .font(.system(size: 200))
                .foregroundColor(.indigo)

            Text(viewModel.badgeItems[safe: 0]?.name ?? "")
                .foregroundColor(.primary)
                .font(.system(size: 34))
            
            VStack {
                Text("\(UserDefaults.standard.streakCount) of")
                Text("22 days streak")
            }
            .padding(.bottom, 40)
            .multilineTextAlignment(.center)
            .frame(width: 300, height: 65)
            .foregroundColor(Color(UIColor.secondaryLabel))
            
//            BadgeItemView(badge: viewModel.badgeItems[safe: 0] ?? BadgeItem(name: "", imageName: "", opacity: 0))
//            BadgeItemView(badge: viewModel.badgeItems[safe: 1] ?? BadgeItem(name: "", imageName: "", opacity: 0))
        }
        .padding(.top, 180)
        .padding(.bottom, 220)
        .padding(.leading, 50)
        .padding(.trailing, 50)
        .background(Color(.secondarySystemBackground))
    }
}


struct SharedBadgesView_Previews: PreviewProvider {
    static var previews: some View {
        BadgesPhotoView()
    }
}
