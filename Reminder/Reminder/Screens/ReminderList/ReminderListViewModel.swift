//
//  ReminderListViewModel.swift
//  Reminder
//
//  Created by fulya akan on 13.05.2026.
//
import Foundation

class ReminderListViewModel {
    
    var titles: [String] = []
    var completions: [Bool] = []
    
    func addReminder(title: String) {
        titles.append(title)
        completions.append(false)
        saveReminders()
    }
    
    func toggleCompletion(at index: Int) {
        completions[index].toggle()
        saveReminders()
    }
    
    func numberOfReminders() -> Int {
        titles.count
    }
    
    //load all changes
    func saveReminders() {
        UserDefaults.standard.set(titles, forKey: "titles")
        UserDefaults.standard.set(completions, forKey: "completions")
    }
    
    //app acılınca okur
    func loadReminders() {
        titles = UserDefaults.standard.stringArray(forKey: "titles") ?? []
        completions = UserDefaults.standard.array(forKey: "completions") as? [Bool] ?? []
    }
    
    
}
