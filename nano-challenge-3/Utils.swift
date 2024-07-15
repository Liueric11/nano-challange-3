//
//  Utils.swift
//  nano-challenge-3
//
//  Created by Clarissa Alverina on 15/07/24.
//

import SwiftUI

enum TimeRange {
    case last1Day
    case last7Days
    case last1Month
}

struct TimeRangePicker: View {
    @Binding var value: TimeRange

    var body: some View {
        Picker(selection: $value.animation(.easeInOut), label: EmptyView()) {
            Text("D").tag(TimeRange.last1Day)
            Text("W").tag(TimeRange.last7Days)
            Text("M").tag(TimeRange.last1Month)
        }
        .pickerStyle(.segmented)
    }
}

struct Transaction: Identifiable, Hashable {
    let id = UUID()
}

/// A few fake transactions for display.
let transactions = [
    Transaction(),
    Transaction(),
    Transaction(),
    Transaction(),
    Transaction(),
    Transaction(),
    Transaction(),
    Transaction()
]

struct TransactionsLink: View {
    var body: some View {
        NavigationLink("Show Transactions", value: transactions)
    }
}

struct TransactionsView: View {
    let transactions: [Transaction]

    var body: some View {
        List {
            ForEach(transactions) { _ in
                HStack { Text("Year Month Day"); Text("Style"); Spacer(); Text("123") }
            }
        }
        .redacted(reason: .placeholder)
        .navigationTitle("Transactions")
    }
}
