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
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    weak var delegate: AddReminderDelegate?
    let viewModel = AddReminderViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextView.text = ""
        updateDateTimeLabels()
        
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.layer.borderColor = UIColor.lightGray.cgColor
        descriptionTextView.layer.cornerRadius = 8
        descriptionTextView.text = ""
        //updateDateTimeLabels()
    }
    
    //add viewdidappear func for keybord 
    
    func updateDateTimeLabels() {
        dateLabel.text = viewModel.getCurrentDate()
        timeLabel.text = viewModel.getCurrentTime()
    }
    
    @IBAction func saveTapped(_ sender: UIButton) {
        viewModel.title = descriptionTextView.text ?? ""
        guard viewModel.isFormValid() else { return }
        delegate?.didAddReminder(title: viewModel.title)
        dismiss(animated: true)
    }
    //move all func reminderViewModel
}
