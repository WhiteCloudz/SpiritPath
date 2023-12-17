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
             setupBackroundImageToVievController(imageNamed: "backround-5" , backroundView: contentView)

             let bookmarkIcon = UIImage(systemName: "bookmark")
             let bookPagesIcon = UIImage(systemName: "doc.text.magnifyingglass")
             let viewBookmarkIcon = UIImage(systemName: "list.bullet.rectangle.portrait")

           
             let goToPageButton = UIButton(type: .system)
             goToPageButton.frame = CGRect(x: 10, y: 15, width: 40, height: 40)
             goToPageButton.backgroundColor = .clear
             goToPageButton.tintColor = UIColor(hex: "201B4D")
             goToPageButton.setImage(bookPagesIcon, for: .normal)
             goToPageButton.layer.cornerRadius = goToPageButton.bounds.height / 2
             goToPageButton.addTarget(self, action: #selector(showPageSelectionAlert), for: .touchUpInside)
             dismiss(animated: true, completion: nil)
             view.addSubview(goToPageButton)

             let viewBookmarksButton = UIButton(type: .system)
             viewBookmarksButton.frame = CGRect(x: 10, y: 65, width: 40, height: 40)
             viewBookmarksButton.backgroundColor = .clear
             viewBookmarksButton.tintColor = UIColor(hex: "201B4D")
             viewBookmarksButton.setImage(viewBookmarkIcon, for: .normal)
             viewBookmarksButton.layer.cornerRadius = viewBookmarksButton.bounds.height / 2
             viewBookmarksButton.addTarget(self, action: #selector(openBookmarksPopover), for: .touchUpInside)
             dismiss(animated: true, completion: nil)
             view.addSubview(viewBookmarksButton)

             let addBookmarkButton = UIButton(type: .system)
             addBookmarkButton.frame = CGRect(x: 10, y: 115, width: 40, height: 40)
             addBookmarkButton.backgroundColor = .clear
             addBookmarkButton.tintColor = UIColor(hex: "201B4D")
             addBookmarkButton.setImage(bookmarkIcon, for: .normal)
             addBookmarkButton.layer.cornerRadius = addBookmarkButton.bounds.height / 2
             addBookmarkButton.addTarget(self, action: #selector(addBookmarks), for: .touchUpInside)
             dismiss(animated: true, completion: nil)
             view.addSubview(addBookmarkButton)

                 contentView.addSubview(goToPageButton)
                 contentView.addSubview(viewBookmarksButton)
                 contentView.addSubview(addBookmarkButton)

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
       
    
       func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
           return .none
       }
       
       
       
    @objc func openBookmarksPopover() {
        dismiss(animated: true, completion: nil)

        let popoverContent = UIViewController()
        popoverContent.modalPresentationStyle = .popover
        popoverContent.preferredContentSize = CGSize(width: 250, height: 500)
        
            let popoverController = popoverContent.popoverPresentationController
            popoverController?.delegate = self
            popoverController?.permittedArrowDirections = []
            
            let tableView = UITableView(frame: CGRect(x: 5, y: 20, width: 80, height: 30))
            tableView.dataSource = self
            tableView.delegate = self
            tableView.backgroundColor = UIColor(hex: "D9D9D9")
            tableView.register(UINib(nibName: "BookMarksTableViewCell", bundle: nil), forCellReuseIdentifier: "BookMarksTableViewCell")
            popoverContent.view = tableView
            popoverTableView = tableView
            popoverTableView.rowHeight = 25

            let screenWidth = UIScreen.main.bounds.width
            let scaledWidth: CGFloat = 250
            let rightMargin: CGFloat = 0
            let topMargin: CGFloat = 100
            
            popoverController?.sourceView = self.view
            popoverController?.sourceRect = CGRect(x: screenWidth - scaledWidth - rightMargin, y: topMargin, width: scaledWidth, height: 0)
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
