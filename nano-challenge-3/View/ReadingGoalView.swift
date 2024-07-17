//
//  ReadingGoalView.swift
//  nano-challenge-3
//
//  Created by Clarissa Alverina on 17/07/24.
//

import SwiftUI

struct ReadingGoalView: View {
    @State private var selectedTime = Date()
    @State private var isOn: Bool = false
    @State private var isReminderAppear: Bool = false
    @Binding var isGoalModalPresented: Bool
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                Text("Set Your Reading Goal")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Text("Read every day, set your goals, and embrace your reading journey")
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .foregroundColor(.secondary)
                
                ZStack{
                    DatePicker("Select a time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                        .datePickerStyle(WheelDatePickerStyle())
                        .labelsHidden()
                        .padding(.bottom, 30)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Text("per day")
                        .padding(.bottom, 30)
                        .padding(.leading, 200)
                        .font(.title2)
                        .fontWeight(.regular)
                }
                
                Toggle(isOn: $isOn) {
                    Text("Reminder")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                .padding(0)
                if isOn {
                    List {
                        HStack {
                            Text("Time")
                                .font(.body)
                                .fontWeight(.regular)
                            
                            Spacer()
                            
                            DatePicker("Select a time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                                .labelsHidden()
                        }
                        HStack {
                            Text("Repeat")
                                .font(.system(size: 17))
                            Spacer()
                            Text("Never")
                                .font(.system(size: 17))
                                .foregroundColor(.secondary)
                            Image(systemName: "chevron.right")
                                .font(
                                    Font.custom("SF Pro", size: 17)
                                        .weight(.semibold)
                                )
                                .foregroundColor(Color(UIColor.tertiaryLabel))
                        }
                    }
                    .listStyle(.plain)
                    .transition(.slide)
                    .padding(0)
                } else {
                    Spacer()
                }
            }
            .padding(.horizontal, 16)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button(action: {
                        isGoalModalPresented = false
                    }) {
                        Text("Save")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.indigo)
                    }
                }
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Reading Goal")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func formatTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
}
