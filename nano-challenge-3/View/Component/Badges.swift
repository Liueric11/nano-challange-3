//
//  Badges.swift
//  nano-challenge-3
//
//  Created by Clarissa Alverina on 16/07/24.
//

import SwiftUI

struct Badges: View {
    @StateObject private var viewModel = BadgesViewModel()
    
    var body: some View {
        ForEach(viewModel.badgeItems, id: \.name) { badge in
            BadgeItemView(badge: badge)
        }
    }
}

struct BadgeItemView: View {
    var badge: BadgeItem
    
    var body: some View {
        VStack {
            Image(systemName: badge.imageName)
                .opacity(badge.opacity)
                .font(.system(size: 62))
                .foregroundColor(.indigo)
            Text(badge.name)
                .font(.footnote)
                .foregroundColor(.primary)
        }
    }
}

#Preview {
    Badges()
}

