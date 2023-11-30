//
//  YourViewController.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 10/8/23.
//

import UIKit
import CoreData
import UniformTypeIdentifiers

class ZikirViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPopoverPresentationControllerDelegate  {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
           return .portrait
       }

       override var shouldAutorotate: Bool {
           return false
       }
    
    @IBOutlet var backroundView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var isPopoverVisible = false
    var popoverContent: UIViewController?
    var counterData = [ZikirData]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackroundImageToVievController(imageNamed: "backround-5" , backroundView: backroundView)
        setupView()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchDataSource()
        updateCellsZikirFromUserDefaults()
        ToolTipMessage()
    }

    
    func setupView() {
        setupSegmentedControl()
        setupTableView()
    }
    
    func setupSegmentedControl() {
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: "ZikirViewCell", bundle: nil), forCellReuseIdentifier: "ZikirViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        fetchDataSource()
        updateCellsZikirFromUserDefaults()
    }
    
    @IBAction func openButtonsPopover(_ sender: Any) {
        openPopover()
    }
    
    
    @IBAction func AddNewZikir(_ sender: Any) {
        AddZikir ()
    }
    
    
    
    @objc func AddZikir() {
            dismiss(animated: true, completion: nil)
            
            let currentDate = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let date = dateFormatter.string(from: currentDate)
            
            let alert = UIAlertController(title: "Add New Zikir", message: "Please enter the Name and Daily Goal of zikir in the designated field.", preferredStyle: .alert)
            alert.addTextField { textField in
                textField.placeholder = "Zikir Name"
            }
            
            alert.addTextField { textField in
                textField.placeholder = "Daily Goal (Optional)"
            }
            
            alert.addAction(UIAlertAction(title: "Add Zikir", style: .default) { [weak self] _ in
                guard let self = self,
                      let zikirName = alert.textFields?.first?.text, !zikirName.isEmpty, let goal = alert.textFields?.last?.text else {
                    self?.showAlert(title: "Error", message: "Please make sure all fields are completed")
                    return
                }
                
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context = appDelegate.persistentContainer.viewContext
                
                let fetchRequest: NSFetchRequest<RoutineData> = RoutineData.fetchRequest()
                fetchRequest.predicate = NSPredicate(format: "name == %@", zikirName)
                
                do {
                    let existingZikir = try context.fetch(fetchRequest).first
                    
                    if existingZikir != nil {
                        self.showAlert(title: "Error", message: "The zikir name is already taken. Please enter a new name.")
                    } else {
                        let zikir = RoutineData(context: context)
                       
                        zikir.name = zikirName
                        zikir.today = "0"
                        zikir.total = "0"
                        zikir.date = date
                        zikir.category = "Zikir"
                        if goal.isEmpty{
                        zikir.goal = "0"
                        }else {
                        zikir.goal = goal
                        }
                        
                        try context.save()
                        let newZikirData = ZikirData(ZikirName: zikirName, ZikirDescription: "", ZikirRecomend: "", ZikirToday: "0", SavedDate: dateFormatter.string(from: currentDate), ZikirTotal: "0", ZikirControl: "")
                        counterData.append(newZikirData)
                        self.tableView.reloadData()
                        
                       
                    }
                } catch {
                    self.showAlert(title: "Error", message: "Data was not read.")
                }
            })
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            present(alert, animated: true, completion: nil)
        }

       
    
    func fetchDataSource() {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let controlDate = dateFormatter.string(from: currentDate)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<RoutineData> = RoutineData.fetchRequest()
        
        do {
            let NewZikir = try context.fetch(fetchRequest)
            
            counterData.removeAll()
            
            for zikir in NewZikir {
                guard let zikirName = zikir.name,
                      let zikirDate = zikir.date,
                      let zikirTotal = zikir.total,
                      let zikirCategory = zikir.category,
                      let zikirToday = zikir.today else { continue }
                
                let todayZikir = controlDate == zikirDate ? zikirToday : "0"
                switch segmentedControl.selectedSegmentIndex {
                case 0:
                    if zikirCategory == "Zikir" {
                        counterData.append(ZikirData(ZikirName: zikirName, ZikirDescription: "", ZikirRecomend: "", ZikirToday: todayZikir, SavedDate: zikirDate, ZikirTotal: zikirTotal, ZikirControl: ""))
                    }
                default:
                    break
                }
            }
            
            tableView.reloadData()
        } catch {
            
        }
    }
    
    func UpdateCounterData() {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let controlDate = dateFormatter.string(from: currentDate)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<RoutineData> = RoutineData.fetchRequest()
        
        var selectedSegmentData: [ZikirData]
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            selectedSegmentData = counterData
        case 1:
            selectedSegmentData = asmaList
        case 2:
            selectedSegmentData = recomendList
        default:
            selectedSegmentData = []
        }
        
        do {
            let NewZikir = try context.fetch(fetchRequest)
            
            for zikir in NewZikir {
                guard let zikirName = zikir.name,
                      let zikirDate = zikir.date,
                      let zikirTotal = zikir.total,
                      let zikirToday = zikir.today else { continue }
                let todayAndTotal = "\(zikirToday) / \(zikirTotal)"
                let controlTodayAndTotal = "\("0") / \(zikirTotal)"
                
                if let index = selectedSegmentData.firstIndex(where: { $0.ZikirName == zikirName }) {
                    selectedSegmentData[index].ZikirTotal = zikirTotal
                    selectedSegmentData[index].ZikirToday = zikirToday
                    
                    
                    let indexPath = IndexPath(row: index, section: 0)
                    if let cell = tableView.cellForRow(at: indexPath) as? ZikirViewCell {
                        if controlDate == zikirDate {
                           cell.zikirTodayAndTotal.text = todayAndTotal
                        }else {
                           cell.zikirTodayAndTotal.text = controlTodayAndTotal
                        }
                    }
                }
            }
        } catch {
        }
    }
    
    
    
    func updateCellsZikirFromUserDefaults() {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let controlDate = dateFormatter.string(from: currentDate)
        
        let selectedList: [ZikirData]
        
        switch segmentedControl.selectedSegmentIndex {
        case 1:
            selectedList = asmaList
        case 2:
            selectedList = recomendList
        default:
            return
        }
        
        for (index, zikir) in selectedList.enumerated() {
            let nameEsma = zikir.ZikirName
            let CounterKey = "zikir_\(nameEsma)"
            
            if let savedData = UserDefaults.standard.dictionary(forKey: CounterKey) as? [String: String],
               let totalValue = savedData["totalZikir"],
               let todayValue = savedData["todayZikir"],
               let savedDate = savedData["zikirDate"] {
                zikir.ZikirTotal = totalValue
                let todayAndTotal = "\(todayValue) / \(todayValue)"
                let controlTodayAndTotal = "\("0") / \(todayValue)"
                
                let indexPath = IndexPath(row: index, section: 0)
                
                if let cell = tableView.cellForRow(at: indexPath) as? ZikirViewCell {
                    if controlDate == savedDate {
                       cell.zikirTodayAndTotal.text = todayAndTotal
                    }else {
                       cell.zikirTodayAndTotal.text = controlTodayAndTotal
                    }
                }
            }
        }
    }
}


