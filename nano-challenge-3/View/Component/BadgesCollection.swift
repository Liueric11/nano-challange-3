//
//  BadgesCollection.swift
//  nano-challenge-3
//
//  Created by Clarissa Alverina on 15/07/24.
//

import SwiftUI

struct BadgesCollection: View {
    @State private var navigateToBadgeCollection = false
    
    var body: some View {
        VStack{
            ZStack {
                Rectangle()
                    .frame(width: 361, height: 200)
                    .foregroundColor(Color(UIColor.secondarySystemGroupedBackground))
                    .cornerRadius(10)
                
                VStack {
                    VStack {
                        HStack(spacing: 110) {
                            Text("Badges Collection")
                                .font(.system(size: 17))
                                .fontWeight(.semibold)
                                .frame(width: 200, alignment: .leading)
                    
                            NavigationLink(destination: BadgeCollectionView()) {
                                Image(systemName: "chevron.right")
                                    .font(
                                        Font.custom("SF Pro", size: 17)
                                            .weight(.semibold)
                                    )
                                    .foregroundColor(.indigo)
                            }
                        } .frame(maxWidth: .infinity, alignment: .center)
                        
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 329, height: 1)
                            .background(Color(UIColor.secondaryLabel))
                    }
                    
                    HStack (spacing: 16){
                    Badges()
                    }
                    .padding(.top, 20)
                }
                .frame(width: 361, height: 200)
                    .padding(.bottom, 10)
            }
        }
    }
}

#Preview {
    BadgesCollection()
}
