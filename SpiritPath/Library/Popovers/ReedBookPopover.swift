//
//  ReadBookPagePopovers.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 10/27/23.
//
import UIKit
import PDFKit
import CoreData

extension ReadBookPage{
    
    func openButtonPopover(){
           
             let popoverContentController = UIViewController()

             let contentView = UIView(frame: CGRect(x: 180, y: 98, width: 180, height: 300))
        contentView.backgroundColor = .clear

             let bookmarkIcon = UIImage(systemName: "bookmark.fill")
             let bookPagesIcon = UIImage(systemName: "book.pages.fill")
             let viewBookmarkIcon = UIImage(systemName: "doc.text.magnifyingglass")

           
             let goToPageButton = UIButton(type: .system)
             goToPageButton.frame = CGRect(x: 10, y: 5, width: 40, height: 40)
             goToPageButton.backgroundColor = .clear
             goToPageButton.tintColor = UIColor(hex: "2FA1D6")
             goToPageButton.setImage(bookPagesIcon, for: .normal)
             goToPageButton.layer.cornerRadius = goToPageButton.bounds.height / 2
             goToPageButton.addTarget(self, action: #selector(showPageSelectionAlert), for: .touchUpInside)
             dismiss(animated: true, completion: nil)
             view.addSubview(goToPageButton)

             let viewBookmarksButton = UIButton(type: .system)
             viewBookmarksButton.frame = CGRect(x: 10, y: 55, width: 40, height: 40)
             viewBookmarksButton.backgroundColor = .clear
             viewBookmarksButton.tintColor = UIColor(hex: "2FA1D6")
             viewBookmarksButton.setImage(viewBookmarkIcon, for: .normal)
             viewBookmarksButton.layer.cornerRadius = viewBookmarksButton.bounds.height / 2
             viewBookmarksButton.addTarget(self, action: #selector(openBookmarksPopover), for: .touchUpInside)
             dismiss(animated: true, completion: nil)
             view.addSubview(viewBookmarksButton)

             let addBookmarkButton = UIButton(type: .system)
             addBookmarkButton.frame = CGRect(x: 10, y: 105, width: 40, height: 40)
             addBookmarkButton.backgroundColor = .clear
             addBookmarkButton.tintColor = UIColor(hex: "2FA1D6")
             addBookmarkButton.setImage(bookmarkIcon, for: .normal)
             addBookmarkButton.layer.cornerRadius = addBookmarkButton.bounds.height / 2
             addBookmarkButton.addTarget(self, action: #selector(addBookmarks), for: .touchUpInside)
             dismiss(animated: true, completion: nil)
             view.addSubview(addBookmarkButton)

                 contentView.addSubview(goToPageButton)
                 contentView.addSubview(viewBookmarksButton)
                 contentView.addSubview(addBookmarkButton)

                popoverContentController.view = contentView
                popoverContentController.preferredContentSize = CGSize(width: 60, height: 160)
                popoverContentController.modalPresentationStyle = .popover
                if let popoverPresentationController = popoverContentController.popoverPresentationController {
                     popoverPresentationController.permittedArrowDirections = .any
                     popoverPresentationController.delegate = self
                     popoverPresentationController.sourceView = self.view
                     popoverPresentationController.sourceRect = CGRect(x: 415, y: 98, width: 180, height: 170) //
                     present(popoverContentController, animated: true, completion: nil)
                 }

                 isPopoverVisible = true
       }
       
    
       func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
           return .none
       }
       
       
       
    @objc func openBookmarksPopover() {
        dismiss(animated: true, completion: nil)

        let popoverContent = UIViewController()
        popoverContent.modalPresentationStyle = .popover
        popoverContent.preferredContentSize = CGSize(width: 250, height: 500)

        let tableView = UITableView(frame: CGRect(x: 5, y: 20, width: 80, height: 60))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.clear

        let backgroundImage = UIImage(named: "backround-5")
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.contentMode = .scaleAspectFill
        tableView.backgroundView = backgroundImageView

        tableView.register(UINib(nibName: "BookMarksTableViewCell", bundle: nil), forCellReuseIdentifier: "BookMarksTableViewCell")
        popoverContent.view = tableView
        popoverTableView = tableView

        let popoverController = popoverContent.popoverPresentationController
        popoverController?.sourceView = self.view
        popoverController!.sourceRect = CGRect(x: 415, y: 100, width: 250, height: 500)
        popoverController?.permittedArrowDirections = .any
        popoverController?.delegate = self
        present(popoverContent, animated: true, completion: nil)
    }
    
    @objc func addBookmarks(){
        dismiss(animated: true, completion: nil)
        let alert = UIAlertController(title: "Add Explanation", message: "Please add your explanation", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Explanation"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(cancelAction)
        
        let goAction = UIAlertAction(title: "Enter", style: .default) { [weak self] _ in
            
         let appDelegate = UIApplication.shared.delegate as! AppDelegate
         let context = appDelegate.persistentContainer.viewContext
            
         let currentPageNumber = (self?.pdfView.currentPage?.pageRef?.pageNumber ?? 0) - 1
         guard let bookName = self?.bookText else {return}
         let description = alert.textFields?.first?.text
         let fetchRequest: NSFetchRequest<Bookmarks> = Bookmarks.fetchRequest()
         let pageNumber = String(describing: currentPageNumber)
         fetchRequest.predicate = NSPredicate(format: "bookPage == %@", pageNumber)
         
         do {
             let existingZikir = try context.fetch(fetchRequest).first
             
             if existingZikir != nil {
                 self?.showAlert(title: "Error", message: "The page already contains a bookmark.")
             } else {
                 let book = Bookmarks(context: context)
                 book.bookName = bookName
                 book.bookDescription = description
                 book.bookPage = String(describing: currentPageNumber)
                 try context.save()
                 
                 let page = String(describing: currentPageNumber)
                 let newBookmark = Popover(bookName: bookName, bookPage: page, bookDescription: description ?? "String Data")
                 self?.dataSource.append(newBookmark)
                 self?.tableView.reloadData()
                 
                 self?.showAlert(title: "Success", message: "Bookmark added successfully.")
             }
         } catch {
             self?.showAlert(title: "Error", message: "Data was not read.")
         }
        }
        alert.addAction(goAction)
        
        present(alert, animated: true, completion: nil)
    }
  
    func fetchCounterDataSource() {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest: NSFetchRequest<Bookmarks> = Bookmarks.fetchRequest()
        
            guard let name = bookText else {return}
            let predicate = NSPredicate(format: "bookName == %@", name)
            fetchRequest.predicate = predicate
           
        do {
                let bookmarks = try context.fetch(fetchRequest)
                
                dataSource.removeAll()
                
                for bookmark in bookmarks {
                    guard let bookName = bookmark.bookName,
                          let bookPage = bookmark.bookPage,
                          let bookDescription = bookmark.bookDescription else { continue }
                  
                        dataSource.append(Popover(bookName: bookName, bookPage: bookPage, bookDescription: bookDescription))
                
                }
                
                tableView.reloadData()
            } catch {
               
            }
        }
    
    
}
