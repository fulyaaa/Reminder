//
//  ReminderListViewModel.swift
//  Reminder
//
//  Created by fulya akan on 13.05.2026.
//
import Foundation

struct ReminderModel{
    var isCompleted: Bool
    let title: String
}

class ReminderListViewModel {
    
    var reminders: [ReminderModel] = []
    
    func addReminder(title: String) {
        
        let reminder: ReminderModel = .init(isCompleted: false, title: title)
        reminders.append(reminder)
        
        saveReminders()
    }
    
    func toggleCompletion(at index: Int) {
        reminders[index].isCompleted.toggle()
        saveReminders()
    }
    
    func numberOfReminders() -> Int {
        reminders.count
    }
    
    func saveReminders() {
        let titles = reminders.map { $0.title }
        let completions = reminders.map{ $0.isCompleted }
        UserDefaults.standard.set(titles, forKey: "titles")
        UserDefaults.standard.set(completions, forKey: "completions")
    }
    
    func loadReminders() {
        let titles = UserDefaults.standard.stringArray(forKey: "titles") ?? []
        let completions = UserDefaults.standard.array(forKey: "completions") as? [Bool] ?? []
                
        reminders = titles.enumerated().map { index, title in
            ReminderModel(isCompleted: completions[index], title: title)
        }
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
