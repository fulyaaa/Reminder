//
//  ViewController.swift
//  Reminder
//
//  Created by fulya akan on 13.05.2026.
//

import UIKit

class ReminderListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var addButton: UIButton!
    
    private let viewModel = ReminderListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.loadReminders()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: collectionView.frame.width - 32, height: 56)
        layout.minimumLineSpacing = 8
        layout.headerReferenceSize = CGSize(width: collectionView.frame.width, height: 140)
        collectionView.collectionViewLayout = layout
        
        addButton.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 40), forImageIn: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        let stoaryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = stoaryboard.instantiateViewController(withIdentifier: "AddReminderViewController") as! AddReminderViewController
        viewController.delegate = self
        navigationController?.show(viewController, sender: nil)
    }
}

extension ReminderListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfReminders()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReminderCell", for: indexPath) as! ReminderCell
        let reminder = viewModel.reminders[indexPath.item]

        cell.bind(title: reminder.title, isCompleted: reminder.isCompleted)
        cell.delegate = self
        cell.index = indexPath.item
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ReminderHeader", for: indexPath) as! ReminderHeader
        
        let dates = viewModel.getDateStrings()
        let greeting = viewModel.getGreeting()
        header.bind(yesterday: dates.yesterday, today: dates.today, tomorrow: dates.tomorrow, greeting: greeting)
        
        return header
    }
}

extension ReminderListViewController: AddReminderDelegate {
    func didAddReminder(title: String){
        viewModel.addReminder(title: title)
        collectionView.reloadData()
    }
}

extension ReminderListViewController: ReminderCellDelegate {
    func didTapCheckButton(at index: Int) {
        viewModel.toggleCompletion(at: index)
        collectionView.reloadData()
    }
}

//extension ReminderListViewController: UICollectionViewDelegate{
//}




