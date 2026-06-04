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
    
    let viewModel = ReminderListViewModel()

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
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        let stoaryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = stoaryboard.instantiateViewController(withIdentifier: "AddReminderViewController") as! AddReminderViewController
        viewController.delegate = self
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
}

extension ReminderListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfReminders()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReminderCell", for: indexPath) as! ReminderCell
        
        cell.bind(title: viewModel.titles[indexPath.item], isCompleted: viewModel.completions[indexPath.item])
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

extension ReminderListViewController: UICollectionViewDelegate{
}




