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
       _ = UIScreen.main.bounds
        let popoverContent = UIViewController()
        popoverContent.modalPresentationStyle = .popover
        popoverContent.preferredContentSize = CGSize(width: 350, height: 650)
       setupBackroundImageToVievController(imageNamed: "backround-5" , backroundView: popoverContent.view)
       
            let popoverController = popoverContent.popoverPresentationController
            popoverController?.delegate = self
            popoverController?.permittedArrowDirections = .any
            
            
            let addNewBookLabel = UILabel()
            addNewBookLabel.frame = CGRect(x: 25, y: 30, width: 350, height: 30)
            addNewBookLabel.backgroundColor = .clear
            addNewBookLabel.textColor = UIColor(hex: "201B4D")
            addNewBookLabel.font = UIFont.systemFont(ofSize: 18)
            addNewBookLabel.isUserInteractionEnabled = false
            addNewBookLabel.text = "Adding/Deleting a new 'Routine'"
            popoverContent.view.addSubview(addNewBookLabel)
            
            let addBookTextView = UITextView()
            addBookTextView.frame = CGRect(x: 20, y: 60, width: 330, height: 300)
            addBookTextView.textColor = UIColor(hex: "201B4D")
            addBookTextView.backgroundColor = .clear
            addBookTextView.isUserInteractionEnabled = false
            addBookTextView.font = UIFont.systemFont(ofSize: 13)
            addBookTextView.text = """
           To establish your routine, click on the '+' button located in the top left corner of the page. Then, fill in the fields for 'Routine Name' and 'Your Goal.' Next, use the selector at the bottom to choose the category of your routine and click the 'Add' button. Your added routine will appear on the screen.

           If the category of the routine you added is 'Zikir' a counter corresponding to this remembrance will be automatically created in the 'Counter' page.

           Finally, if you wish to delete an added routine, swipe it from right to left and tap the appearing 'Delete' button. This action will permanently erase the routine along with all its data. Remember, deleting a routine in the 'Remembrance' category will also remove it from the 'Counter' page.
           """
            popoverContent.view.addSubview(addBookTextView)
            
            
            let deleteBookLabel = UILabel()
            deleteBookLabel.frame = CGRect(x: 25, y: 360, width: 350, height: 30)
            deleteBookLabel.backgroundColor = .clear
            deleteBookLabel.textColor = UIColor(hex: "201B4D")
            deleteBookLabel.isUserInteractionEnabled = false
            deleteBookLabel.font = UIFont.systemFont(ofSize: 18)
            deleteBookLabel.text = "Updateing a routine"
            popoverContent.view.addSubview(deleteBookLabel)
            
            let deleteBookTextView = UITextView()
            deleteBookTextView.frame = CGRect(x: 20, y: 390, width: 330, height: 300)
            deleteBookTextView.textColor = UIColor(hex: "201B4D")
            deleteBookTextView.isUserInteractionEnabled = false
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
            popoverController?.sourceRect = CGRect(x: 393, y: 80, width: 400, height: 700)
            present(popoverContent, animated: true, completion: nil)
        
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

