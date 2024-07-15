//
//  ChartView.swift
//  nano-challenge-3
//
//  Created by Clarissa Alverina on 15/07/24.
//

import SwiftUI
import Charts

struct ChartView: View {
    @State private var timeRange: TimeRange = .last7Days
    
    @State var scrollPositionStartWeek = SalesData.last365Days.last!.day.addingTimeInterval(3600 * 24 * 7)

    var scrollPositionEndWeek: Date {
        scrollPositionStartWeek.addingTimeInterval(3600 * 24 * 6)
    }
    
    var scrollPositionStringWeek: String {
        scrollPositionStartWeek.formatted(.dateTime.month().day())
    }
    
    var scrollPositionEndStringWeek: String {
        scrollPositionEndWeek.formatted(.dateTime.month().day().year())
    }
    
    @State var scrollPositionStartMonth =
        SalesData.last365Days.last!.day.addingTimeInterval(3600 * 24 * 30)

    var scrollPositionEndMonth: Date {
        scrollPositionStartMonth.addingTimeInterval(3600 * 24 * 30)
    }
    
    var scrollPositionStringMonth: String {
        scrollPositionStartMonth.formatted(.dateTime.month().day())
    }
    
    var scrollPositionEndStringMonth: String {
        scrollPositionEndMonth.formatted(.dateTime.month().day().year())
    }
                                 
    var body: some View {
        VStack {
            List {
                VStack(alignment: .leading) {
                    TimeRangePicker(value: $timeRange)
                        .padding(.bottom)
                    
                    Text("Average")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    
                    switch timeRange {
                    case .last7Days:
                        Text("\(SalesData.salesInPeriod(in: scrollPositionStartWeek...scrollPositionEndWeek)/7, format: .number)")
                            .font(.title2.bold())
                            .foregroundColor(.primary)
                        
                        Text("\(scrollPositionStringWeek) – \(scrollPositionEndStringWeek)")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        
                        WeeklySalesChart(scrollPosition: $scrollPositionStartWeek)
                            .frame(height: 240)
                    case .last1Month:
                        Text("\(SalesData.salesInPeriod(in: scrollPositionStartMonth...scrollPositionEndMonth)/30, format: .number)")
                            .font(.title2.bold())
                            .foregroundColor(.primary)
                        
                        Text("\(scrollPositionStringMonth) – \(scrollPositionEndStringMonth)")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        
                        MonthlySalesChart(scrollPosition: $scrollPositionStartMonth)
                            .frame(height: 240)
                        
                    case.last1Day:
                        Text("\(SalesData.salesInPeriod(in: scrollPositionStartMonth...scrollPositionEndMonth), format: .number)")
                            .font(.title2.bold())
                            .foregroundColor(.primary)
                        
                        Text("\(scrollPositionStringMonth) – \(scrollPositionEndStringMonth)")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        WeeklySalesChart(scrollPosition: $scrollPositionStartWeek)
                            .frame(height: 240)
                    }
                    
                }
                .listRowSeparator(.hidden)
                .transaction {
                    $0.animation = nil // Do not animate between different sets of bars.
                }
            }
            .listStyle(.plain)
            
            
            VStack {
                Text("Your Reading Goal")
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding(.leading, 30)
                
                ZStack {
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 332, height: 123)
                      .background(Color(UIColor.white))
                      .cornerRadius(10)
                    
                    VStack {
                        HStack(spacing: 68){
                            VStack(alignment: .leading){
                                HStack{
                                    Image(systemName: "book")
                                        .font(.system(size: 15))
                                    Text("Next Reading")
                                        .font(.system(size: 15))
                                        .foregroundColor(Color(UIColor.secondaryLabel))
                                }
                                
                                Text("20.00")
                                    .bold()
                                    .font(.system(size: 15))
                            }
                            
                            VStack(alignment: .leading) {
                                HStack{
                                    Image(systemName: "flag.checkered")
                                        .font(.system(size: 15))
                                    Text("Goals")
                                        .font(.system(size: 15))
                                        .foregroundColor(Color(UIColor.secondaryLabel))
                                }
                                
                                HStack{
                                    Text("8")
                                        .font(.system(size: 15))
                                        .bold()
                                    Text("hours per day")
                                        .font(.system(size: 15))
                                        .bold()
                                }
                            }
                        }
                        
                        Text("Tonight")
                            .font(.system(size: 15))
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .foregroundColor(Color(UIColor.secondaryLabel))
                            .padding(.leading, 14)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 318, height: 1)
                            .background(Color(UIColor.secondaryLabel))
                    
                        Button(action: {
                            
                        }, label: {
                            Text("Edit")
                                .font(.system(size: 15))
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                                .padding(.leading, 14)
                                .padding(.top, 5)
                        })
                    
                    }
                    
                }
                .frame(width: 332, height: 123)
            }
            
            VStack{
                Text("Badges Collection")
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding(.leading, 30)
                    .padding(.top, 10)
                
                Text("Read everyday and earn your special badges")
                    .font(.system(size: 15))
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding(.leading, 30)
                    .foregroundColor(Color(UIColor.secondaryLabel))
    
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 332, height: 123)
                        .background(Color(UIColor.white))
                        .cornerRadius(10)
                    
                    
                    
                } .frame(width: 332, height: 123)
            }
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
        
    }
}

#Preview {
    ChartView()
}
