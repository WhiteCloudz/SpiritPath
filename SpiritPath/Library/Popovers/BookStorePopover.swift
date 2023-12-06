//
//  BookStorePopover.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 11/2/23.
//


import UIKit
import CoreData



extension BookStore {
    
    func openPopover(){
        
        let popoverContentController = UIViewController()
        
        let contentView = UIView(frame: CGRect(x: 180, y: 100, width: 180, height: 300))
        contentView.backgroundColor = .clear
        
        let AddBookButtonIcon = UIImage(systemName: "doc.fill.badge.plus")
        let userGuideButtonIcone = UIImage(systemName: "questionmark.app.fill")
        let resetButtonIcone = UIImage(systemName: "trash")
        
        
        let userGuideButton = UIButton(type: .system)
        userGuideButton.frame = CGRect(x: 10, y: 20, width: 40, height: 40)
        userGuideButton.backgroundColor = .clear
        userGuideButton.tintColor = UIColor(hex: "2FA1D6")
        userGuideButton.setImage(userGuideButtonIcone, for: .normal)
        userGuideButton.addTarget(self, action: #selector(openUserGuide), for: .touchUpInside)
        dismiss(animated: true, completion: nil)
        view.addSubview(userGuideButton)
        
        let addBookButton = UIButton(type: .system)
        addBookButton.frame = CGRect(x: 10, y: 70, width: 40, height: 40)
        addBookButton.backgroundColor = .clear
        addBookButton.tintColor = UIColor(hex: "2FA1D6")
        addBookButton.setImage(AddBookButtonIcon, for: .normal)
        addBookButton.addTarget(self, action: #selector(startDocumentPicker), for: .touchUpInside)
        dismiss(animated: true, completion: nil)
        view.addSubview(addBookButton)
        
        let resetButton = UIButton(type: .system)
        resetButton.frame = CGRect(x: 12, y: 115, width: 40, height: 40)
        resetButton.backgroundColor = .clear
        resetButton.tintColor = .red
        resetButton.setImage(resetButtonIcone, for: .normal)
        resetButton.addTarget(self, action: #selector(showDeleteAlert), for: .touchUpInside)
        dismiss(animated: true, completion: nil)
        view.addSubview(resetButton)
    
        contentView.addSubview(userGuideButton)
        contentView.addSubview(addBookButton)
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
       popoverContent?.preferredContentSize = CGSize(width: 290, height: 550)
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
           addNewBookLabel.text = "     Adding a new book:"
           popoverContent.view.addSubview(addNewBookLabel)
           
           let addBookTextView = UITextView()
           addBookTextView.frame = CGRect(x: 20, y: 80, width: 250, height: 140)
           addBookTextView.textColor = .black
           addBookTextView.backgroundColor = .clear
           addBookTextView.font = UIFont.systemFont(ofSize: 15)
           addBookTextView.text = """
            You can add a PDF book to your library by clicking the 'Add Document' button at the bottom of the pop-up window. Please note that the system only accepts files with a PDF extension.
           """
           popoverContent.view.addSubview(addBookTextView)
           
           
           let deleteBookLabel = UILabel()
           deleteBookLabel.frame = CGRect(x: 25, y: 230, width: 250, height: 40)
           deleteBookLabel.backgroundColor = .clear
           deleteBookLabel.textColor = .black
           deleteBookLabel.font = UIFont.systemFont(ofSize: 19)
           deleteBookLabel.text = "     Removing a book:"
           popoverContent.view.addSubview(deleteBookLabel)
           
           let deleteBookTextView = UITextView()
           deleteBookTextView.frame = CGRect(x: 20, y: 275, width: 250, height: 235)
           deleteBookTextView.textColor = .black
           deleteBookTextView.backgroundColor = .clear
           deleteBookTextView.font = UIFont.systemFont(ofSize: 15)
           deleteBookTextView.text = """
            To delete a book from your library, you should swipe the book cover from right to left and click on the 'delete' button that appears. This way, you can delete the books you've added one by one. Please note that you can only delete the books you've added yourself, and once deleted, you won't be able to use the book again without re-uploading it.
           """
           popoverContent.view.addSubview(deleteBookTextView)
           
           let screenWidth = UIScreen.main.bounds.width
           let scaledWidth: CGFloat = 290
           let rightMargin: CGFloat = 0
           let topMargin: CGFloat = 100
           
           popoverController?.sourceView = self.view
           popoverController?.sourceRect = CGRect(x: screenWidth - scaledWidth - rightMargin, y: topMargin, width: scaledWidth, height: 0)
           present(popoverContent, animated: true, completion: nil)
       }
   }
    
    @objc func showDeleteAlert (){
        dismiss(animated: true, completion: nil)
        let alert = UIAlertController(title: "Caution", message: "When you click the reset button, all your saved data will be permanently erased and cannot be recovered.", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(cancelAction)
        let goAction = UIAlertAction(title: "Reset", style: .default) { [weak self] _ in
            self?.deleteLibraryData()
            self?.tableView.reloadData()
        }
        alert.addAction(goAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}
