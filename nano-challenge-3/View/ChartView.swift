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
    
    func addNote() {
        let newDate = Date()
        
        let attempts = NoteAccessRecord(openedAt: Date(), closedAt: Date().addingTimeInterval(300))

        let newNote = Note(
            content: [],
//            filename: "apa ini",
            createdAt: newDate,
            isPinned: false,
            attempts: [attempts]
        )
        modelContext.insert(newNote)
    }
                                 
    var body: some View {
//        NavigationView {
            ScrollView {
                VStack {
                    Spacer().frame(height: 90)
                    Text("Habit Report")
                        .frame(alignment: .center)
                        .fontWeight(.semibold)
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color(UIColor.secondarySystemGroupedBackground))
                        TestChart()
                            .padding()
                    }
                    
                    Button(action: {
                        addNote()
                    }) {
                        Text("Add New Record")
                    }

                    
                    YourReadingGoal()
                        .padding(.bottom, 30)
                        .padding(.top, 15)
                    
                    BadgesCollection()
                    
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemGroupedBackground))
            .edgesIgnoringSafeArea(.top)
//        }
    }
}

#Preview {
    ChartView()
}
