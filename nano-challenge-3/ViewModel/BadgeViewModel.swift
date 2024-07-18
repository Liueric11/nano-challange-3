//
//  ChartViewModel.swift
//  nano-challenge-3
//
//  Created by Clarissa Alverina on 16/07/24.
//

import Foundation

class BadgesViewModel: ObservableObject {
    @Published var badgeItems: [BadgeItem] = [
        BadgeItem(name: "Good Starter", imageName: "leaf.circle", opacity: 0.1),
        BadgeItem(name: "Elevating Growth", imageName: "camera.macro.circle", opacity: 0.1),
        BadgeItem(name: "Steady Tree", imageName: "tree.circle", opacity: 0.1)
    ]
}

extension Array {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
