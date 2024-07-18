//
//  BadgeCollectionView.swift
//  nano-challenge-3
//
//  Created by Clarissa Alverina on 16/07/24.
//

import SwiftUI

struct BadgeCollectionView: View {
    @State private var isBadgeModalPresented = false
    @ObservedObject var viewModel = BadgesViewModel()
    
    var body: some View {
        VStack {
            Spacer().frame(height: 110)
            VStack (alignment: .leading){
                Text("Badge")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .padding(.bottom, 8)
                Text("Collect your badge then reading became your habit.")
                    .font(.system(size: 15))
                    .foregroundColor(Color(UIColor.secondaryLabel))
            }
            .padding(.bottom, 20)
            .padding(.trailing, 10)
            
            HStack (spacing: 30){
                Button(action: {
                    isBadgeModalPresented.toggle()
                }) {
                    BadgeItemView(badge: viewModel.badgeItems[safe: 0] ?? BadgeItem(name: "", imageName: "", opacity: 0))
                        .frame(width: 105)
                }
                
                BadgeItemView(badge: viewModel.badgeItems[safe: 1] ?? BadgeItem(name: "", imageName: "", opacity: 0))
                    .frame(width: 105)
                
                BadgeItemView(badge: viewModel.badgeItems[safe: 2] ?? BadgeItem(name: "", imageName: "", opacity: 0))
                    .frame(width: 105)
                
//                Badges()
            }
            .sheet(isPresented: $isBadgeModalPresented) {
                ShareBadges(isBadgeModalPresented: $isBadgeModalPresented)
            }
            
            HStack (spacing: 38){
                VStack {
                    Text("22 of")
                    Text("22 days streak")
                        .multilineTextAlignment(.center)
                        
                } .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)

                VStack {
                    Text("22 of")
                    Text("44 days streak")
                        .multilineTextAlignment(.center)
                        
                } .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)

                VStack {
                    Text("22 of")
                    Text("66 days streak")
                        .multilineTextAlignment(.center)
                       
                } .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            }
            .font(.system(size: 13))
            .foregroundColor(Color(UIColor.secondaryLabel))
            .padding(.top, 1)
            
            Spacer()
        } 
        .edgesIgnoringSafeArea(.top)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
    }
}

#Preview {
    BadgeCollectionView()
}
