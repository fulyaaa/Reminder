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
    
    func saveReminders() {
        UserDefaults.standard.set(titles, forKey: "titles")
        UserDefaults.standard.set(completions, forKey: "completions")
    }
    
    func loadReminders() {
        titles = UserDefaults.standard.stringArray(forKey: "titles") ?? []
        completions = UserDefaults.standard.array(forKey: "completions") as? [Bool] ?? []
    }
    
    func getDateStrings() -> (yesterday:String, today:String, tomorrow: String){
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM"
        
        let today = Date()
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: today)!
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: today)!
        
        return(
            yesterday: formatter.string(from: yesterday),
            today: formatter.string(from: today),
            tomorrow: formatter.string(from: tomorrow)
        )
    }
    
    func getGreeting() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 6..<12:
            return "Good Morning"
        case 12..<18:
            return "Good Afternoon"
        case 18..<22:
            return "Good Evening"
        default:
            return "Good Night"
        }
    }
    
}
