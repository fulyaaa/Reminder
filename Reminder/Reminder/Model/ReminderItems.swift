//
//  ReminderItems.swift
//  Reminder
//
//  Created by fulya akan on 15.05.2026.
//
import Foundation

struct ReminderItems: Codable {
    //UserDefaults'a kaydetmek için gerekli, "bu veriyi kaydet/oku" : Codable
    var title: String
    var date: Date
    var isCompleted: Bool
}
