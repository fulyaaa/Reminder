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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 8
    }
    
    func bind(title: String, isCompleted: Bool) {
        let checkboxImage = isCompleted ? "checkmark.circle.fill" : "circle"
        checkButton.setImage(UIImage(systemName: checkboxImage), for: .normal)
        
        if isCompleted {
            let attributedString = NSAttributedString(
                string: title,
                attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue]
            )
            taskTitleLabel.attributedText = attributedString
        } else {
            taskTitleLabel.attributedText = nil
            taskTitleLabel.text = title
        }
    }
    
    @IBAction func checkButtonTapped(_ sender: UIButton) {
        delegate?.didTapCheckButton(at: index)
    }
}
