//
//  ChartView.swift
//  nano-challenge-3
//
//  Created by Clarissa Alverina on 15/07/24.
//

import SwiftUI
import Charts
import SwiftData

struct ChartView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var notes: [Note]
                                     
    var body: some View {
            ScrollView {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(UIColor.secondarySystemGroupedBackground))
                    TestChart()
                        .padding()
                }
                
                
                YourReadingGoal()
                    .padding(.bottom, 30)
                
                BadgesCollection()
            }
            .navigationTitle("Habit Report")
            .toolbarTitleDisplayMode(.inline)
            .background(Color(.systemGroupedBackground))
    }
}

#Preview {
    NavigationStack{
        ChartView()
    }
}
