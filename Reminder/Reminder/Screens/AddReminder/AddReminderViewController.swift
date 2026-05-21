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
    
    @IBOutlet weak var dataLabel: UIStackView!
    @IBOutlet weak var timeLabel: UIStackView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    weak var delegate: AddReminderDelegate?
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextView.text = ""
    }
    
    @IBAction func saveTapped(_ sender: UIButton) {
        guard let title = descriptionTextView.text, !title.isEmpty else { return }
        delegate?.didAddReminder(title: title)
        dismiss(animated: true)
    }
    
}
