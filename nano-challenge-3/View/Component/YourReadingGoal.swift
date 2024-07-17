//
//  YourReadingGoal.swift
//  nano-challenge-3
//
//  Created by Clarissa Alverina on 15/07/24.
//

import SwiftUI

struct YourReadingGoal: View {
    @State private var isGoalModalPresented = false
    
    var body: some View {
        VStack {
            Text("Your Reading Goal")
                .font(.system(size: 17))
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(.leading, 20)
                .padding(.bottom, 20)
            
            ZStack {
                Rectangle()
                  .frame(width: 361, height: 161)
                  .foregroundColor(Color(UIColor.secondarySystemGroupedBackground))
                  .cornerRadius(10)
                
                VStack {
                    HStack(alignment: .firstTextBaseline, spacing: 50){
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
                                Text("8")
                                    .font(.system(size: 20))
                                    .bold()
                            }
                            
                            Text("hours per day")
                                .font(.system(size: 15))
                                .bold()
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(alignment: .leading){
                            HStack{
                                Image(systemName: "book")
                                    .font(.system(size: 15))
                                Text("Next Reading")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color(UIColor.secondaryLabel))
                            }
                            .padding(.bottom, 10)
                            
                            Text("20.00")
                                .bold()
                                .font(.system(size: 20))
                            
                            Text("Tonight")
                                .font(.system(size: 15))
                                .foregroundColor(Color(UIColor.secondaryLabel))
                                
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
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
            ReadingGoalView()
        }
    }
}

#Preview {
    YourReadingGoal()
}
