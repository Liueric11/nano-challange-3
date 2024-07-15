//
//  OnboardingViewModel.swift
//  nano-challenge-3
//
//  Created by Clarissa Alverina on 15/07/24.
//

import SwiftUI
import Combine

class HabitViewModel: ObservableObject {
    @Published var habit = Habit(
        title: "Reading Habit",
        description: "Read every day, set your goals, and embrace your reading journey.",
        readingTime: "Reading Time",
        completedHours: 0,
        totalHours: 0
    )
    
    @Published var folders = [
        Folder(icon: "folder", name: "All iCloud", count: 26),
        Folder(icon: "note.text", name: "Notes", count: 26),
        Folder(icon: "trash", name: "Recently Deleted", count: 26)
    ]
    
    @Published var habitList = ""
}


