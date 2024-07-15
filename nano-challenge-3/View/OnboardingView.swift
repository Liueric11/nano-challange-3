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
                
                ZStack {
                    Rectangle()
                        .frame(width: 361, height: 133)
                        .cornerRadius(12)
                        .foregroundColor(.white)
                    
                    VStack {
                        HStack(spacing: 4) {
                            Image(systemName: "timer")
                                .foregroundColor(.indigo)
                                .font(.system(size: 13))
                            Text(viewModel.habit.readingTime)
                                .font(.system(size: 13))
                            
                            Spacer()
                            
                            Button(action: {
                                // Action for button
                            }) {
                                Image(systemName: "chevron.right")
                                    .font(
                                        Font.custom("SF Pro", size: 17)
                                            .weight(.semibold)
                                    )
                                    .foregroundColor(.indigo)
                                    .padding(.trailing, 27)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 32)
                        
                        HStack(alignment: .firstTextBaseline) {
                            Text("\(viewModel.habit.completedHours)")
                                .font(.system(size: 22))
                                .fontWeight(.bold)
                            
                            Text("of \(viewModel.habit.totalHours) hours")
                            
                            OverviewChartView()
                                .padding(.leading, 100)
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 32)
                        .padding(.top, 15)
                    }
                }
                .padding(.bottom, 17)
                
                List {
                    Section(header:
                                Text("iCloud")
                        .padding(.leading, -16)
                    ) {
                        ForEach(viewModel.folders, id: \.name) { folder in
                            HStack {
                                Image(systemName: folder.icon)
                                    .foregroundColor(.indigo)
                                Text(folder.name)
                                    .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
                                    .font(.system(size: 17))
                                Text("\(folder.count)")
                                    .frame(width: 45, height: 16, alignment: .trailing)
                                    .font(.system(size: 17))
                                    .foregroundColor(.secondary)

                                Button(action: {

                                }) {
                                    Image(systemName: "chevron.right")
                                        .font(
                                            Font.custom("SF Pro", size: 17)
                                                .weight(.semibold)
                                        )
                                        .foregroundColor(Color(UIColor.tertiaryLabel))
                                }
                            }
                        }
                    }
                    .headerProminence(.increased)
                }
                .listStyle(.insetGrouped)
                
                HStack(alignment: .top) {
                    Image(systemName: "folder.badge.plus")
                    Spacer()
                    Image(systemName: "square.and.pencil")
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 0)
                .foregroundColor(.indigo)
                .font(.system(size: 20))
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
