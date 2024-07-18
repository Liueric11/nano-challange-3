//
//  YourReadingGoal.swift
//  nano-challenge-3
//
//  Created by Clarissa Alverina on 15/07/24.
//

import SwiftUI

struct YourReadingGoal: View {
    @State private var isGoalModalPresented = false
    @State private var selectedHour: Int = UserDefaults.standard.integer(forKey: "selectedHour")
    @State private var selectedMinute: Int = UserDefaults.standard.integer(forKey: "selectedMinute")
    @State private var isReminder: Bool = UserDefaults.standard.bool(forKey: "isReminder")
    @State private var selectedRepeat: RepeatType? = RepeatType(rawValue: UserDefaults.standard.string(forKey: "selectedRepeat") ?? "")
    @State private var selectedTimeRepeat: Date = UserDefaults.standard.object(forKey: "selectedTimeRepeat") as? Date ?? Date()
    
    var body: some View {
        VStack {
            Text("Your Reading Goal")
                .font(.title3)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(.horizontal, 16)
            
            VStack{
                HStack{
                    VStack(alignment: .leading, spacing: 16){
                        Label {
                            Text("Goals")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.indigo)
                        } icon: {
                            Image(systemName: "flag.checkered")
                                .foregroundColor(.indigo)
                        }
                        
                        VStack(alignment: .leading, spacing: 4){
                            Text("\(selectedHour)")
                                .font(.title3)
                                .fontWeight(.semibold)
                            
                            Text("hours per day")
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 16){
                        Label {
                            Text("Next Reading")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.indigo)
                        } icon: {
                            Image(systemName: "book")
                                .foregroundColor(.indigo)
                        }
                        
                        VStack(alignment: .leading, spacing: 4){
                            Text("\(formattedTime(from: selectedTimeRepeat))")
                                .font(.title3)
                                .fontWeight(.semibold)
                            
                            Text("\(selectedRepeat?.rawValue ?? "Everday")")
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding(0)
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)
                    .padding(.bottom, 8)
                
                Button(action: {
                    isGoalModalPresented.toggle()
                }, label: {
                    Text("Edit")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                })
            }
            .padding(16)
            .background(Color(UIColor.secondarySystemGroupedBackground))
            .cornerRadius(10)
            .padding(.horizontal, 16)
        }
        .sheet(isPresented: $isGoalModalPresented) {
            ReadingGoalView(isGoalModalPresented: $isGoalModalPresented)
        }
    }
    
    private func formattedTime(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
}

#Preview {
    YourReadingGoal()
}
