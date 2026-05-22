//
//  ReminderHeader.swift
//  Reminder
//
//  Created by fulya akan on 22.05.2026.
//
import UIKit

class ReminderHeader: UICollectionReusableView {
    
    @IBOutlet weak var yesterdayLabel: UILabel!
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var tomorrowLabel: UILabel!
    @IBOutlet weak var greetingLabel: UILabel!
    
    func bind(yesterday: String, today: String, tomorrow: String, greeting: String) {
        yesterdayLabel.text = yesterday
        todayLabel.text = today
        tomorrowLabel.text = tomorrow
        greetingLabel.text = greeting
    }
}
