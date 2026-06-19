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
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        descriptionTextView.becomeFirstResponder()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func updateDateTimeLabels() {
        dateLabel.text = viewModel.getCurrentDate()
        timeLabel.text = viewModel.getCurrentTime()
    }
    
    @IBAction func saveTapped(_ sender: UIButton) {
        viewModel.title = descriptionTextView.text ?? ""
        guard viewModel.isFormValid() else { return }
        delegate?.didAddReminder(title: viewModel.title)
        navigationController?.popToRootViewController(animated: true)
    }
}
