//
//  ReadingGoalView.swift
//  nano-challenge-3
//
//  Created by Clarissa Alverina on 17/07/24.
//

import SwiftUI

struct ReadingGoalView: View {
    @State private var selectedHour: Int = UserDefaults.standard.integer(forKey: "selectedHour")
    @State private var selectedMinute: Int = UserDefaults.standard.integer(forKey: "selectedMinute")
    @State private var isReminder: Bool = UserDefaults.standard.bool(forKey: "isReminder")
    @State private var selectedRepeat: RepeatType? = RepeatType(rawValue: UserDefaults.standard.string(forKey: "selectedRepeat") ?? "")
    @State private var selectedTimeRepeat: Date = UserDefaults.standard.object(forKey: "selectedTimeRepeat") as? Date ?? Date()
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
                
                
                HStack(spacing: 0){
                    Picker("Hours", selection: $selectedHour) {
                        ForEach(0..<6) { hour in
                            Text("\(hour) hour")
                                .tag(hour)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: 100)
                    .clipped()
                    
                    Picker("Minutes", selection: $selectedMinute) {
                        ForEach(0..<60) { minute in
                            Text("\(minute) min")
                                .tag(minute)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: 100)
                    .clipped()
                    
                    Text("per day")
                        .font(.title2)
                        .fontWeight(.regular)
                }
                
                Toggle(isOn: $isReminder) {
                    Text("Reminder")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                .padding(0)
                
                if isReminder {
                    List {
                        HStack {
                            Text("Time")
                                .font(.body)
                                .fontWeight(.regular)
                            
                            Spacer()
                            
                            DatePicker("Select a time", selection: $selectedTimeRepeat, displayedComponents: .hourAndMinute)
                                .labelsHidden()
                        }
                        
                        Picker("Reading Type", selection: $selectedRepeat) {
                            ForEach(RepeatType.allCases) { option in
                                Text(option.rawValue)
                                    .font(.body)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.indigo)
                                    .tag(Optional(option))
                            }
                        }
                        .pickerStyle(.navigationLink)
                        .padding(0)
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
                        saveToUserDefaults()
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
    
    private func saveToUserDefaults() {
        UserDefaults.standard.set(selectedHour, forKey: "selectedHour")
        UserDefaults.standard.set(selectedMinute, forKey: "selectedMinute")
        UserDefaults.standard.set(isReminder, forKey: "isReminder")
        UserDefaults.standard.set(selectedRepeat?.rawValue, forKey: "selectedRepeat")
        UserDefaults.standard.set(selectedTimeRepeat, forKey: "selectedTimeRepeat")
    }
}
