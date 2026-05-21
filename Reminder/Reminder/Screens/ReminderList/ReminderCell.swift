//
//  ReminderCell.swift
//  Reminder
//
//  Created by fulya akan on 13.05.2026.
//
import UIKit

protocol ReminderCellDelegate: AnyObject{
    func didTapCheckButton(at index: Int)
}

class ReminderCell: UICollectionViewCell {
    
    @IBOutlet weak var taskTitleLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    
    weak var delegate: ReminderCellDelegate?
    var index: Int = 0
    
    func bind(title: String, isCompleted: Bool) {
        taskTitleLabel.text = title
        let checkboxImage = isCompleted ? "checkmark.circle.fill" : "circle"
        checkButton.setImage(UIImage(systemName: checkboxImage), for: .normal)
    }
    
    @IBAction func checkButtonTapped(_ sender: UIButton) {
        delegate?.didTapCheckButton(at: index)
    }
}
