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
        NavigationView {
            VStack (alignment: .leading){
                Button(action: {
                    isGoalModalPresented = false
                }) {
                    Text("Save")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 20)
                    .padding()
                    .foregroundColor(.indigo)
                    .fontWeight(.semibold)
                }
                    
                
//                Text("Set Your Reading Goals")
//                    .font(.system(size: 22))
//                    .fontWeight(.bold)
//                    .padding(.bottom, 29)
//                    .frame(maxWidth: .infinity, alignment: .center)
                
                Text("Set Your Reading Goal")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .padding(.leading, 16)
                
                Text("Read every day, set your goals, and embrace your reading journey ")
                    .font(Font.custom("SF Pro", size: 15))
                    .foregroundColor(.secondary)
                    .frame(width: 336)
                    .padding(.leading, 16)
                
                ZStack{
                    DatePicker("Select a time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                        .datePickerStyle(WheelDatePickerStyle())
                        .labelsHidden()
                        .padding(.bottom, 30)
                        .frame(maxWidth: .infinity, alignment: .center)
                    Text("per day")
                        .padding(.bottom, 30)
                        .padding(.leading, 200)
                        .font(.system(size: 17))
                }
                
                Text("Reminder")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding(.leading, 16)
                
                List {
                    Section {
                        HStack {
                            Toggle(isOn: $isOn) {
                                Text("Alarm")
                            }
                            .onChange(of: isOn) { value in
                                isReminderAppear = value
                            }
                        }
                    }.listRowBackground(Color(UIColor.secondarySystemFill))
                    
                    if isReminderAppear {
                        Section {
                            HStack {
                                Text("Time")
                                    .font(.system(size: 17))
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
                    }
                }
                .padding(.top, -15)
                
//                Text("hello")
//                    .padding(.leading, 40)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemGroupedBackground))
        }
    }
    
    private func formatTime(_ date: Date) -> String {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            return formatter.string(from: date)
        }
    
}

//#Preview {
//    ReadingGoalView(isGoalModalPresented: $isGoalModalPresented)
//}
