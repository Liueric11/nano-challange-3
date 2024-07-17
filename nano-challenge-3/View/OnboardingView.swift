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
        NavigationStack {
            VStack {
                ReadingTimeOnboarding()
                
                FolderList()
                
                BottomNavBar()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.onboarding)
            .navigationTitle("Folders")
            .searchable(text: $viewModel.habitList)
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    OnboardingView()
}
