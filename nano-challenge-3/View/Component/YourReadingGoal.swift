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
                .padding(16)
            
            VStack{
                VStack{
                    HStack{
                        Label {
                            Text("Goals")
                        } icon: {
                            Image(systemName: "flag.checkered") // Replace with your image name
                        }
                    }
                }
            }
            .background(Color(UIColor.secondarySystemGroupedBackground))
            
            ZStack {
                Rectangle()
                  .frame(width: 361, height: 161)
                  .foregroundColor(Color(UIColor.secondarySystemGroupedBackground))
                  .cornerRadius(10)
                
                VStack {
                    HStack(alignment: .firstTextBaseline){
                        VStack(alignment: .leading) {
                            HStack{
                                Image(systemName: "flag.checkered")
                                    .font(.system(size: 15))
                                Text("Goals")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color(UIColor.secondaryLabel))
                            }
                            .padding(.bottom, 10)
                            
                            HStack{
                                Text("\(selectedHour)")
                                    .font(.system(size: 20))
                                    .bold()
                            }
                            
                            Text("hours per day")
                                .font(.system(size: 15))
                                .bold()
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        if isReminder {
                            VStack(alignment: .leading){
                                HStack{
                                    Image(systemName: "book")
                                        .font(.system(size: 15))
                                    Text("Next Reading")
                                        .font(.system(size: 15))
                                        .foregroundColor(Color(UIColor.secondaryLabel))
                                }
                                .padding(.bottom, 10)
                                
                                Text("\(formattedTime(from: selectedTimeRepeat))")
                                    .bold()
                                    .font(.system(size: 20))
                                
                                Text("\(selectedRepeat?.rawValue ?? "Everday")")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color(UIColor.secondaryLabel))
                                    
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .padding(.leading, 20)
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 329, height: 1)
                        .background(Color(UIColor.secondaryLabel))
                        .padding(.top, 10)
                
                    Button(action: {
                        isGoalModalPresented.toggle()
                    }, label: {
                        Text("Edit")
                            .font(.system(size: 15))
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .padding(.leading, 18)
                            .padding(.top, 5)
                    })
                
                }
                
            }
            .frame(width: 361, height: 123)
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
