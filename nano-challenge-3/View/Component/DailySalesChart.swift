////
////  DailySalesChart.swift
////  nano-challenge-3
////
////  Created by Clarissa Alverina on 15/07/24.
////
//
//import SwiftUI
//import Charts
//
//struct DailySalesChart: View {
//    @Binding var scrollPosition: Date
//
//    var body: some View {
//        Chart {
//            ForEach(SalesData.last365Days, id: \.day) { dayData in
//                BarMark(
//                    x: .value("Day", dayData.day, unit: .day),
//                    y: .value("Sales", dayData.sales)
//                )
//                .annotation {
//                    Text("\(dayData.sales)")
//                        .font(.system(size: 8))
//                        .padding()
//                }            }
//            .foregroundStyle(.blue)
//        }
//        .chartScrollableAxes(.horizontal)
//        .chartXVisibleDomain(length: 3600 * 24 * 7)
//        .chartScrollTargetBehavior(
//            .valueAligned(
//                matching: .init(hour: 0),
//                majorAlignment: .matching(.init(day: 1))))
//        .chartScrollPosition(x: $scrollPosition)
//        .chartXAxis {
//            AxisMarks(values: .stride(by: .day, count: 1)) {
//                AxisTick()
//                AxisGridLine()
//                AxisValueLabel(format: .dateTime.month().day())
//            }
//        }
//        
//    }
//}
////#Preview {
////    DailySalesChart(scrollPosition: $scrollPositionStartWeek)
////}
