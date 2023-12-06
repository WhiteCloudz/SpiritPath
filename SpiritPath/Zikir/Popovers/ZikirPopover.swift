//
//  ZikirViewControllerPopover.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 11/5/23.
//

import UIKit
import CoreData



extension ZikirViewController {
    
    func openPopover() {
        let popoverContentController = UIViewController()
        
        let contentView = UIView()
        contentView.backgroundColor = .clear
        
        let AddBookButtonIcon = UIImage(systemName: "plus.square.fill.on.square.fill")
        let userGuideButtonIcone = UIImage(systemName: "questionmark.app.fill")
        let resetButtonIcone = UIImage(systemName: "trash")
        
        let userGuideButton = UIButton(type: .system)
        userGuideButton.frame = CGRect(x: 10, y: 20, width: 40, height: 40)
        userGuideButton.backgroundColor = .clear
        userGuideButton.tintColor = UIColor(hex: "2FA1D6")
        userGuideButton.setImage(userGuideButtonIcone, for: .normal)
        userGuideButton.addTarget(self, action: #selector(openUserGuide), for: .touchUpInside)
        contentView.addSubview(userGuideButton)
        
        let addZikirButton = UIButton(type: .system)
        addZikirButton.frame = CGRect(x: 10, y: 70, width: 40, height: 40)
        addZikirButton.backgroundColor = .clear
        addZikirButton.tintColor = UIColor(hex: "2FA1D6")
        addZikirButton.setImage(AddBookButtonIcon, for: .normal)
        addZikirButton.addTarget(self, action: #selector(AddZikir), for: .touchUpInside)
        contentView.addSubview(addZikirButton)
        
        let resetButton = UIButton(type: .system)
        resetButton.frame = CGRect(x: 10, y: 115, width: 40, height: 40)
        resetButton.backgroundColor = .clear
        resetButton.tintColor = .red
        resetButton.setImage(resetButtonIcone, for: .normal)
        resetButton.addTarget(self, action: #selector(showDeleteAlert), for: .touchUpInside)
        contentView.addSubview(resetButton)
        
        popoverContentController.view = contentView
        popoverContentController.preferredContentSize = CGSize(width: 60, height: 170)
        popoverContentController.modalPresentationStyle = .popover
        
        if let popoverPresentationController = popoverContentController.popoverPresentationController {
            popoverPresentationController.permittedArrowDirections = []
            popoverPresentationController.delegate = self
            popoverPresentationController.sourceView = self.view
        
            let screenWidth = UIScreen.main.bounds.width
            let scaledWidth: CGFloat = 60
            let rightMargin: CGFloat = 0
            let topMargin: CGFloat = 80
            
            popoverPresentationController.sourceRect = CGRect(x: screenWidth - scaledWidth - rightMargin, y: topMargin, width: scaledWidth, height: 0)
        }
        
        present(popoverContentController, animated: true, completion: nil)
        
        isPopoverVisible = true
    }
    
   @objc func openUserGuide(){
        
       dismiss(animated: true, completion: nil)

       popoverContent = UIViewController()
       popoverContent?.modalPresentationStyle = .popover
       popoverContent?.preferredContentSize = CGSize(width: 290, height: 560)
       popoverContent?.view.backgroundColor = .clear

       if let popoverContent = popoverContent {
           let popoverController = popoverContent.popoverPresentationController
           popoverController?.delegate = self
           popoverController?.permittedArrowDirections = []
           
           
           let addNewBookLabel = UILabel()
           addNewBookLabel.frame = CGRect(x: 25, y: 40, width: 250, height: 40)
           addNewBookLabel.backgroundColor = .clear
           addNewBookLabel.textColor = .black
           addNewBookLabel.font = UIFont.systemFont(ofSize: 19)
           addNewBookLabel.text = "     Adding a new zikir:"
           popoverContent.view.addSubview(addNewBookLabel)
           
           let addBookTextView = UITextView()
           addBookTextView.frame = CGRect(x: 20, y: 80, width: 250, height: 60)
           addBookTextView.textColor = .black
           addBookTextView.backgroundColor = .clear
           addBookTextView.font = UIFont.systemFont(ofSize: 15)
           addBookTextView.text = """
           You can add a new zikir by clicking the "+" button at the bottom of the opened window.
           """
           popoverContent.view.addSubview(addBookTextView)
           
           
           let deleteBookLabel = UILabel()
           deleteBookLabel.frame = CGRect(x: 25, y: 150, width: 250, height: 40)
           deleteBookLabel.backgroundColor = .clear
           deleteBookLabel.textColor = .black
           deleteBookLabel.font = UIFont.systemFont(ofSize: 19)
           deleteBookLabel.text = "     Removing a zikir:"
           popoverContent.view.addSubview(deleteBookLabel)
           
           let deleteBookTextView = UITextView()
           deleteBookTextView.frame = CGRect(x: 20, y: 190, width: 250, height: 220)
           deleteBookTextView.textColor = .black
           deleteBookTextView.backgroundColor = .clear
           deleteBookTextView.font = UIFont.systemFont(ofSize: 15)
           deleteBookTextView.text = """
            To delete a dhikr you've added, you need to swipe the dhikr from right to left and press the 'delete' button that appears. This way, you can delete the dhikrs you've added one by one. Please remember that you can only delete the dhikrs you've added yourself. Also, keep in mind that once you delete a dhikr, all data associated with that dhikr will be permanently removed.
           """
           popoverContent.view.addSubview(deleteBookTextView)
           
           let resetCounterLabel = UILabel()
           resetCounterLabel.frame = CGRect(x: 25, y: 410, width: 250, height: 40)
           resetCounterLabel.backgroundColor = .clear
           resetCounterLabel.textColor = .black
           resetCounterLabel.font = UIFont.systemFont(ofSize: 19)
           resetCounterLabel.text = "     Reseting a counter:"
           popoverContent.view.addSubview(resetCounterLabel)
           
           let  resetCounterTextView = UITextView()
           resetCounterTextView.frame = CGRect(x: 20, y: 450, width: 250, height: 80)
           resetCounterTextView.textColor = .black
           resetCounterTextView.backgroundColor = .clear
           resetCounterTextView.font = UIFont.systemFont(ofSize: 15)
           resetCounterTextView.text = """
            "By pressing and holding the Counter button on the Counter page for a few seconds, you can reset the zikir values."
           """
           popoverContent.view.addSubview(resetCounterTextView)

           let screenWidth = UIScreen.main.bounds.width
           let scaledWidth: CGFloat = 290
           let rightMargin: CGFloat = 0
           let topMargin: CGFloat = 100
           
           popoverController?.sourceView = self.view
           popoverController?.sourceRect = CGRect(x: screenWidth - scaledWidth - rightMargin, y: topMargin, width: scaledWidth, height: 0)
           present(popoverContent, animated: true, completion: nil)
       }
   }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
    
    @objc func showDeleteAlert (){
        dismiss(animated: true, completion: nil)
        let alert = UIAlertController(title: "Caution", message: "When you click the reset button, all your saved data will be permanently erased and cannot be recovered.", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(cancelAction)
        let goAction = UIAlertAction(title: "Reset", style: .default) { [weak self] _ in
            self?.deleteZikirAndRoutineData()
           
        }
        alert.addAction(goAction)
        tableView.reloadData()
        present(alert, animated: true, completion: nil)
    }
}
