//
//  OnboardingView.swift
//  nano-challenge-3
//
//  Created by Clarissa Alverina on 15/07/24.
//

import SwiftUI
import Charts

struct OnboardingView: View {
    @ObservedObject var viewModel = HabitViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ReadingTimeOnboarding()
                
                FolderList()
                
                BottomNavBar()
            }
            .background(Color(.secondarySystemBackground))
            .navigationTitle("Folders")
            .searchable(text: $viewModel.habitList)
        }
    }
}

#Preview {
    OnboardingView()
}
