//
//  AddReminderViewModel.swift
//  Reminder
//
//  Created by fulya akan on 13.05.2026.

import Foundation

class AddReminderViewModel {
    
    var title: String = ""
    
    func isFormValid() -> Bool {
        !title.isEmpty
    }
    
    func getCurrentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, d MMM"
        return formatter.string(from: Date())
    }
    
    func getCurrentTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: Date())
    }
}
