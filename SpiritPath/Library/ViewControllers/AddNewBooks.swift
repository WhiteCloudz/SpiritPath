//
//  BookStoreNewBookPcker.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 11/2/23.
//

import UIKit
import PDFKit
import CoreData
import UniformTypeIdentifiers




extension BookStore {

@objc func startDocumentPicker(){
   dismiss(animated: true, completion: nil)
   
    if let pdfUTType = UTType("com.adobe.pdf") {
           let allowedContentTypes: [UTType] = [pdfUTType]
           let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: allowedContentTypes)
           documentPicker.delegate = self
           present(documentPicker, animated: true, completion: nil)
       }
}


func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        if let pdfURL = urls.first {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fileNameWithoutExtension = pdfURL.deletingPathExtension().lastPathComponent
            
            let fetchRequest = NSFetchRequest<DataOfLibrary>(entityName: "LibraryData")
            fetchRequest.predicate = NSPredicate(format: "bookName == %@", fileNameWithoutExtension)
            
            do {
                let existingBooks = try context.fetch(fetchRequest)
                if existingBooks.count > 0 {
                    self.showAlert(title: "Error", message: "This book is already registered in your application.")
                    return
                }
            } catch {
                print("Book query error: \(error)")
            }
            
            if let entity = NSEntityDescription.entity(forEntityName: "LibraryData", in: context) {
                let newBook = DataOfLibrary(entity: entity, insertInto: context)
                newBook.pdfURL = pdfURL.absoluteString
                newBook.bookName = fileNameWithoutExtension
                
                let bookImages = [
                     "books",
                     "books2",
                     "books3",
                     "books4",
                     "books5",
                     "books6",
                     "books7",
                     "books8",
                     "books9",
                     "books10"
                   ]
                let randomIndex = Int.random(in: 0..<bookImages.count)
                let selectedImage = bookImages[randomIndex]
                newBook.bookImage = selectedImage
                
                let bookNew = Library(bookImage: UIImage(named: selectedImage), bookTitle: fileNameWithoutExtension, currentAndTotal: "0 / 0")
                    dataSource.append(bookNew)
                    self.tableView.reloadData()
               
                do {
                    try context.save()
                    self.showAlert(title: "Success", message: "Successfully saved.")
                   
                } catch {
                    print("PDF saving error: \(error)")
                   
                }
            }
        } else {
            print("No PDF file selected or an incorrect file was chosen.")
        }
    }
    
    

    func fetchLibraryData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<DataOfLibrary> = DataOfLibrary.fetchRequest()
        
        do {
            let newBook = try context.fetch(fetchRequest)
            
            for book in newBook {
                guard let name = book.bookName, let imageName = book.bookImage else { continue }
                
            
                let newBook = Library(bookImage: UIImage(named: imageName),bookTitle: name, currentAndTotal: "")
                dataSource.append(newBook)
            }
            tableView.reloadData()
        } catch {
            print("Error retrieving book data.: \(error)")
        }
    }
}
