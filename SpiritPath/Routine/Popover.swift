//
//  RoutinePageSetupPopover.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 11/15/23.
//


import UIKit
import CoreData



extension RoutinePage {
    
   @objc func openUserGuide(){
        
        dismiss(animated: true, completion: nil)
        
        popoverContent = UIViewController()
        popoverContent?.modalPresentationStyle = .popover
        popoverContent?.preferredContentSize = CGSize(width: 350, height: 650)
        popoverContent?.view.backgroundColor = .clear
        
        if let popoverContent = popoverContent {
            let popoverController = popoverContent.popoverPresentationController
            popoverController?.delegate = self
            popoverController?.permittedArrowDirections = .any
            
            
            let addNewBookLabel = UILabel()
            addNewBookLabel.frame = CGRect(x: 25, y: 30, width: 350, height: 30)
            addNewBookLabel.backgroundColor = .clear
            addNewBookLabel.textColor = .black
            addNewBookLabel.font = UIFont.systemFont(ofSize: 18)
            addNewBookLabel.text = "Adding/Deleting a new 'Routine'"
            popoverContent.view.addSubview(addNewBookLabel)
            
            let addBookTextView = UITextView()
            addBookTextView.frame = CGRect(x: 20, y: 60, width: 330, height: 300)
            addBookTextView.textColor = .black
            addBookTextView.backgroundColor = .clear
            addBookTextView.font = UIFont.systemFont(ofSize: 13)
            addBookTextView.text = """
           To create your routine, fill in the 'Routine Name' and 'Your Goal' fields. Then, at the bottom, use picker to select the category of your routine and click on the 'Add' button. Your added routine will appear on the screen.

           If the category of your added routine is 'Zikir', a corresponding counter for this zikir will be automatically created on the 'Counter' page.

           Finally, if you want to delete a routine you've added, simply swipe the routine from right to left and tap on the 'Delete' button that appears. This action will permanently delete the routine along with all its data. Remember, when you delete a routine in the 'Zikir' category, it will also be removed from the 'Counter' page.
           """
            popoverContent.view.addSubview(addBookTextView)
            
            
            let deleteBookLabel = UILabel()
            deleteBookLabel.frame = CGRect(x: 25, y: 360, width: 350, height: 30)
            deleteBookLabel.backgroundColor = .clear
            deleteBookLabel.textColor = .black
            deleteBookLabel.font = UIFont.systemFont(ofSize: 18)
            deleteBookLabel.text = "Updateing a routine"
            popoverContent.view.addSubview(deleteBookLabel)
            
            let deleteBookTextView = UITextView()
            deleteBookTextView.frame = CGRect(x: 20, y: 390, width: 330, height: 300)
            deleteBookTextView.textColor = .black
            deleteBookTextView.backgroundColor = .clear
            deleteBookTextView.font = UIFont.systemFont(ofSize: 13)
            deleteBookTextView.text = """
            Your 'Zikir' routines' 'Now' values are automatically calculated based on your interactions with the corresponding counters on the counter page; you cannot change them from here.
            For 'Prayer' and 'Reading' routines, you need to manually update them by selecting values from the picker.
            If you want to change the Goal values of your routines, you can do so by clicking on the icon of the routine you wish to modify.
            Based on the values you input here, your daily and weekly reports will be generated.
           """
            popoverContent.view.addSubview(deleteBookTextView)
            
            
            
            popoverController?.sourceView = self.view
            popoverController?.sourceRect = CGRect(x: 385, y: 100, width: 400, height: 700)
            present(popoverContent, animated: true, completion: nil)
        }
    }
        
        func adaptiveRoutinePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
            return .none
        }
        
        
        func ToolTipMessage(){
            let isPopupShown = UserDefaults.standard.bool(forKey: "routinePopupShown")
            if !isPopupShown {
                let alert = UIAlertController(title: "Tooltip", message: """
             
            Firstly, click on the add icon located at the bottom of the page to create your routine.
          
            Your 'Zikir' routines' 'Now' values are automatically calculated based on your interactions with the corresponding counters on the counter page; you cannot change them from here.
          
            For 'Prayer' and 'Reading' routines, you need to manually update them by selecting values from the picker.
          
            If you want to change the Goal values of your routines, you can do so by clicking on the icon of the routine you wish to modify.
          
          Based on the values you input here, your daily and weekly reports will be generated.
          """, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default))
                present(alert, animated: true, completion: nil)
                UserDefaults.standard.set(true, forKey: "routinePopupShown")
            }
            
        }
    }

