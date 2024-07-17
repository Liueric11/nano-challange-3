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
        FolderItem(icon: "folder", name: "All iCloud", count: 26),
        FolderItem(icon: "note.text", name: "Notes", count: 22),
        FolderItem(icon: "trash", name: "Recently Deleted", count: 9)
    ]
    
    @Published var habitList = ""
}


