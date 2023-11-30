//
//  ReadBookPage.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 7.08.2023.
//

import UIKit
import PDFKit
import CoreData


class ReadBookPage: UIViewController, UIPopoverPresentationControllerDelegate{
   
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
           return .portrait
       }

       override var shouldAutorotate: Bool {
           return false
       }
    
    @IBOutlet var backroundView: UIView!
    @IBOutlet weak var pageNumber: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var popoverTableView: UITableView!
    var dataSource = [Popover]()
    var pdfView: PDFView!
    var bookText:String?
    var pdfDocument: PDFDocument?
    var isPopoverVisible = false
    var popoverController: UIPopoverPresentationController?
  
    
    override func viewDidLoad() {
           super.viewDidLoad()

        setupBackroundImageToVievController(imageNamed: "backround-3" , backroundView: backroundView)
        
        loadLocalPDF()
        pdfView = PDFView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: tableView.bounds.height))
        pdfView.backgroundColor = .clear
        pdfView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        pdfView.autoScales = true
        pdfView.displayDirection = .vertical
        pdfView.displayMode = .singlePageContinuous
        pdfView.document = pdfDocument

        let containerView = UIView(frame: pdfView.frame)
        containerView.addSubview(pdfView)
        tableView.tableHeaderView = containerView
        
        isPopoverVisible = false
        pageNumber.isEnabled = false
//        self.tabBarController?.tabBar.isHidden = true
        NotificationCenter.default.addObserver(self, selector: #selector(pdfViewPageChanged(_:)), name: .PDFViewPageChanged, object: pdfView)
        
        callCurrentPageOfThisBook()
        updatePageNumberLabel()
        fetchCounterDataSource()
        
       }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        routineReminderMessage()
    }
    
    func loadLocalPDF() {
        guard let bookText = bookText else { return }
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest: NSFetchRequest<DataOfLibrary> = DataOfLibrary.fetchRequest()
            
            do {
                let libraryData = try context.fetch(fetchRequest)
                
                for book in libraryData {
                    if book.bookName == bookText, let pdfURLString = book.pdfURL, let url = URL(string: pdfURLString) {
                        let document = PDFDocument(url: url)
                        pdfDocument = document
                        return
                    }
                }
                
                if let pathInMainBundle = Bundle.main.path(forResource: bookText, ofType: "pdf", inDirectory: "Books") {
                    let documentInMainBundle = PDFDocument(url: URL(fileURLWithPath: pathInMainBundle))
                    pdfDocument = documentInMainBundle
                }
            } catch {
         
            }
        }
    }
    
    
    func callCurrentPageOfThisBook() {
        guard let bookName = bookText else { return }
        let BookKey = "book_\(bookName)"
        
        if let savedData = UserDefaults.standard.dictionary(forKey: BookKey) as? [String: String],
           let currentPage = savedData["current"],
           let pageNumber = Int(currentPage),
           pageNumber > 1,
           pageNumber <= pdfDocument?.pageCount ?? 1 {
            
           let page = pdfDocument?.page(at: pageNumber - 1)
            pdfView.go(to: page!)
            updatePageNumberLabel()
        }
    }
    
    
    @IBAction func openButtonsPopover(_ sender: Any) {
        openButtonPopover()
    }
    
    func updatePageNumberLabel() {
            let currentPageNumber = (pdfView.currentPage?.pageRef?.pageNumber ?? 0 ) - 1
        let totalPageNumber = pdfView.document?.pageCount ?? 0
        pageNumber.text = "\(currentPageNumber) / \(totalPageNumber)"
        
        guard let bookName = bookText else {return}
        let BookKey = "book_\(bookName)"
        
        let savedData: [String: String] = [
            "total": String(describing: totalPageNumber) ,
            "current": String(describing: currentPageNumber)
        ]
        
        UserDefaults.standard.set(savedData, forKey: BookKey)
        }

    
    @objc func pdfViewPageChanged(_ notification: Notification) {
            updatePageNumberLabel()
        }

    
       override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
           updatePDFViewFrame()
       }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { [weak self] _ in
            self?.updatePDFViewFrame()
            self?.tableView.reloadData()
        }, completion: nil)
    }
    
    func updatePDFViewFrame() {
        guard let containerView = tableView.tableHeaderView else {return}
        
        let newFrame = CGRect(x: 0, y: 0, width: containerView.bounds.width, height: containerView.bounds.height)
        pdfView.frame = newFrame
        pdfView.autoScales = true
    }


    @IBAction func OpenPagePopUp(_ sender: Any) {
            showPageSelectionAlert()
    }
    
    @objc func showPageSelectionAlert() {
        if presentedViewController != nil {
            dismiss(animated: false) { [weak self] in
                self?.presentPageSelectionAlert()
            }
        } else {
            presentPageSelectionAlert()
        }
    }

    func presentPageSelectionAlert() {
        let alert = UIAlertController(title: "Page Selection", message: "Please enter the number of the page you want to go to.", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Page Number"
            textField.keyboardType = .numberPad
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(cancelAction)
        
        let goAction = UIAlertAction(title: "Go", style: .default) { [weak self] _ in
            if let pageNumberString = alert.textFields?.first?.text,
               let pageNumber = Int(pageNumberString),
               pageNumber > 1,
               pageNumber <= self?.pdfDocument?.pageCount ?? 1 {
                let page = self?.pdfDocument?.page(at: pageNumber )
                self?.pdfView.go(to: page!)
                self?.updatePageNumberLabel()
            }
        }
        alert.addAction(goAction)
        
        present(alert, animated: true, completion: nil)
    }

   
}




extension ReadBookPage: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == popoverTableView {
            return dataSource.count
        }else {
          return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.tableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! LibraryTableViewCell
            
            let library = Library(bookTitle: "Book Title", currentAndTotal: "0 / 0")
            cell.configureCell(library) {
                
            }
            return cell
        } else if tableView == popoverTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BookMarksTableViewCell", for: indexPath) as! BookMarksTableViewCell
            let item = dataSource[indexPath.row]
            cell.bookName.text = item.bookName
            cell.bookPage.text = item.bookPage
            cell.bookDescription.text = item.bookDescription
            
            cell.buttonAction = { // Tıklama işlemini burada tanımlayın
                let bookmarkPage = self.dataSource[indexPath.row]
                let page = bookmarkPage.bookPage
                guard let pageNumber = Int(page) else { return }

                if pageNumber > 1, let pdfDocument = self.pdfDocument, pageNumber <= pdfDocument.pageCount {
                    if let bookPage = pdfDocument.page(at: pageNumber ) {
                        self.pdfView.go(to: bookPage)
                        self.updatePageNumberLabel()
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            }

            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    60
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       
            if editingStyle == .delete {
                let bookmarkToDelete = dataSource[indexPath.row]
                let bookPage = bookmarkToDelete.bookPage
                
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context = appDelegate.persistentContainer.viewContext
                
                let fetchRequest = NSFetchRequest<Bookmarks>(entityName: "Bookmarks")
                fetchRequest.predicate = NSPredicate(format: "bookPage == %@", bookPage)
                
                do {
                    let results = try context.fetch(fetchRequest)
                    if let page = results.first {
                        context.delete(page)
                        try context.save()
                    }
                } catch {
                    print("Error: \(error)")
                }
                self.dataSource.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
    }
    
    
    
}



   
   

