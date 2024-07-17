//
//  ReadingTimeOnboarding.swift
//  nano-challenge-3
//
//  Created by Clarissa Alverina on 15/07/24.
//

import SwiftUI

struct ReadingTimeOnboarding: View {
    
    @ObservedObject var viewModel = HabitViewModel()
    
    var body: some View {
        VStack(spacing: 3) {
            Text(viewModel.habit.title)
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 12)
                .padding(.leading, 21)
            
            Text(viewModel.habit.description)
                .font(.system(size: 15))
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 21)
        }
        .padding(.bottom, 17)
        
        NavigationLink(destination: FilesView()) {
            ZStack {
                Rectangle()
                    .frame(width: 361, height: 133)
                    .cornerRadius(12)
                    .foregroundColor(Color(UIColor.secondarySystemGroupedBackground))
                
                VStack {
                    HStack(spacing: 4) {
                        Image(systemName: "timer")
                            .foregroundColor(.indigo)
                            .font(.system(size: 13))
                        Text(viewModel.habit.readingTime)
                            .font(.system(size: 13))
                        
                        Spacer()
                        
                            Image(systemName: "chevron.right")
                                .font(
                                    Font.custom("SF Pro", size: 17)
                                        .weight(.semibold)
                                )
                                .foregroundColor(.indigo)
                                .padding(.trailing, 27)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 32)
                    
                    HStack(alignment: .firstTextBaseline) {
                        Text("\(viewModel.habit.completedHours)")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                        
                        Text("of \(viewModel.habit.totalHours) hours")
                        
                        OverviewChartView()
                            .padding(.leading, 120)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 32)
                    .padding(.top, 30)
                }
            }
        }
        .padding(.bottom, 17)
    }
}

#Preview {
    ReadingTimeOnboarding()
}
