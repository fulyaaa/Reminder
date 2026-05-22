//
//  AddReminderViewController.swift
//  Reminder
//
//  Created by fulya akan on 13.05.2026.
//
import UIKit

protocol AddReminderDelegate: AnyObject {
    func didAddReminder(title: String)
}

class AddReminderViewController: UIViewController {
    
    //@IBOutlet weak var dataLabel: UIStackView!
    @IBOutlet weak var dateLabel: UILabel!
    //@IBOutlet weak var timeLabel: UIStackView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    weak var delegate: AddReminderDelegate?
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextView.text = ""
        updateDateTimeLabels()
    }
    
    func updateDateTimeLabels() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, d MMM"
        dateLabel.text = dateFormatter.string(from: Date())
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "hh: mm a"
        timeLabel.text = timeFormatter.string(from: Date())
 
    }
    
    @IBAction func saveTapped(_ sender: UIButton) {
        guard let title = descriptionTextView.text, !title.isEmpty else { return }
        delegate?.didAddReminder(title: title)
        dismiss(animated: true)
    }
    
}
