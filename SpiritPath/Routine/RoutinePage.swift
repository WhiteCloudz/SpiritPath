//
//  RoutinePage.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 11/5/23.
//

import UIKit
import CoreData

class RoutinePage: UIViewController, UIPopoverPresentationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
           return .portrait
       }

       override var shouldAutorotate: Bool {
           return false
       }
    
    var nameOfRoutine: String?
    var goalOfRoutine: String?
    var categoryOfRoutine: String?
    var nameTextFiel: UITextField?
    var goalTextFiel: UITextField?
    var pickerView: UIPickerView?
    var updateRoutineGoalName:String?
    let numbers = Array(0...10000)
    
    @IBOutlet var backroundView: UIView!
    @IBOutlet weak var tableView: UITableView!
    var dataSource = [Routine]()
    
    let selectButton = UIButton()
    var categoryOptions = ["Select", "Zikir", "Prayer", "Reading"]
    
    var popoverContent: UIViewController?
    var isPopoverVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackroundImageToVievController(imageNamed: "backround-5" , backroundView: backroundView)
        ToolTipMessage()
        setupTableView()
        fetchCounterDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCounterDataSource()
    }
    
    func setupTableView(){
        tableView.register(UINib(nibName: "RoutineTableViewCell", bundle: nil), forCellReuseIdentifier: "RoutineTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    
    @IBAction func ToolDescription(_ sender: Any) {
        openUserGuide()
        
    }
    
    
    @IBAction func AddNewRoutine(_ sender: Any) {
        openPopover()
    }
    
    func openPopover(){
        
        dismiss(animated: true, completion: nil)
        
        let popoverContentController = UIViewController()
        
        let contentView = UIView(frame: CGRect(x: 180, y: 140, width: 270, height: 320))
        contentView.backgroundColor = .clear
        
        let questionButtonIcone = UIImage(systemName: "questionmark.circle.fill")
        
        nameTextFiel = UITextField()
        nameTextFiel?.frame = CGRect(x: 30, y: 50, width: 240, height: 40)
        nameTextFiel?.backgroundColor = .clear
        nameTextFiel?.borderStyle = .roundedRect
        nameTextFiel?.textAlignment = .center
        nameTextFiel?.placeholder = "Routine Name"
        nameTextFiel?.textColor = .black
        nameTextFiel?.layer.cornerRadius = (nameTextFiel?.bounds.height ?? 0) / 8
        contentView.addSubview(nameTextFiel!)
        
        
        goalTextFiel = UITextField()
        goalTextFiel?.frame = CGRect(x: 30, y: 110, width: 240, height: 40)
        goalTextFiel?.backgroundColor = .clear
        goalTextFiel?.borderStyle = .roundedRect
        goalTextFiel?.textAlignment = .center
        goalTextFiel?.placeholder = "Your Goal"
        goalTextFiel?.keyboardType = .numberPad
        goalTextFiel?.textColor = .black
        goalTextFiel?.layer.cornerRadius = (goalTextFiel?.bounds.height ?? 0) / 8
        contentView.addSubview(goalTextFiel!)
        
        
        pickerView = UIPickerView()
        pickerView?.frame = CGRect(x: 45, y: 170, width: 210, height: 70)
        pickerView?.backgroundColor = .clear
        pickerView?.dataSource = self
        pickerView?.delegate = self
        contentView.addSubview(pickerView!)
        
        let saveButton = UIButton(type: .system)
        saveButton.frame = CGRect(x: 95, y: 290, width: 110, height: 35)
        saveButton.backgroundColor = UIColor(hex: "2FA1D6")
        saveButton.tintColor = .black
        saveButton.setTitle("Save", for: .normal)
        saveButton.layer.cornerRadius = saveButton.bounds.height / 2
        saveButton.addTarget(self, action: #selector(addRoutine), for: .touchUpInside)
        view.addSubview(saveButton)
        contentView.addSubview(saveButton)
        
        let questionButton = UIButton(type: .system)
        questionButton.frame = CGRect(x: 225, y: 5, width: 110, height: 35)
        questionButton.backgroundColor = .clear
        questionButton.tintColor = UIColor(hex: "AC48DD")
        questionButton.addTarget(self, action: #selector(openUserGuide), for: .touchUpInside)
        view.addSubview(questionButton)
        questionButton.setImage(questionButtonIcone, for: .normal)
        contentView.addSubview(questionButton)
        
        popoverContentController.view = contentView
        popoverContentController.preferredContentSize = CGSize(width: 300, height: 350)
        popoverContentController.modalPresentationStyle = .popover
        if let popoverPresentationController = popoverContentController.popoverPresentationController {
            popoverPresentationController.permittedArrowDirections = .down
            popoverPresentationController.delegate = self
            popoverPresentationController.sourceView = self.view
            
            let contentWidth = 300
            let xOffset = (Int(view.bounds.width) - contentWidth) / 2
            popoverPresentationController.sourceRect = CGRect(x: xOffset, y: 740, width: contentWidth, height: 60)
            
            present(popoverContentController, animated: true, completion: nil)
        }
        
        isPopoverVisible = true
    }
   
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(categoryOptions[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCategory = categoryOptions[row]
        categoryOfRoutine = selectedCategory
    }
    
    @objc func addRoutine() {
        dismiss(animated: true, completion: nil)
        
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let name = nameTextFiel?.text, !name.isEmpty,
              let goal = goalTextFiel?.text, !goal.isEmpty,
              let category = categoryOfRoutine, !category.isEmpty, category != "Select"
        else {
            showAlert(title: "Error", message: "Please make sure all fields are completed and select a category")
            return}
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<RoutineData> = RoutineData.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        
        do {
            let existingRoutine = try context.fetch(fetchRequest).first
            
            if existingRoutine != nil {
                showAlert(title: "Error", message: "The routine name is already taken. Please enter a new name.")
            } else {
                let date = dateFormatter.string(from: currentDate)
                
                let routine = RoutineData(context: context)
                
                routine.name = name
                routine.goal = goal
                routine.category = category
                routine.date = date
                routine.today = "0"
                routine.total = "0"
                
                try context.save()
                let newRoutineData = Routine(category: category, date: dateFormatter.string(from: currentDate), goal: goal, name: name, today: "")
                dataSource.append(newRoutineData)
                self.tableView.reloadData()
            }
        } catch {
            showAlert(title: "Error", message: "Data was not read.")
        }
    }
    
    func fetchCounterDataSource() {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        _ = dateFormatter.string(from: currentDate)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<RoutineData> = RoutineData.fetchRequest()
        
        do {
            let routines = try context.fetch(fetchRequest)
            
            dataSource.removeAll()
            
            for routine in routines {
                guard let name = routine.name,
                      let goal = routine.goal,
                      let category = routine.category,
                      let date = routine.date else { continue }
                
                let newRoutineData = Routine(category: category, date: date, goal: goal, name: name, today: "")
                dataSource.append(newRoutineData)
                self.tableView.reloadData()
            }
            
            tableView.reloadData()
        } catch {
            
        }
    }
    
    func UpdateRoutineGoalValue(name: String) {
        let alert = UIAlertController(title: "Update Routine", message: "Please enter the Daily Goal of routine in the designated field.", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Daily Goal"
            textField.keyboardType = .numberPad
        }
        
        alert.addAction(UIAlertAction(title: "Update", style: .default) { [weak self] _ in
            guard let goal = alert.textFields?.last?.text, !goal.isEmpty else {
                self?.showAlert(title: "Error", message: "Please make sure all fields are completed")
                return
            }
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest: NSFetchRequest<RoutineData> = RoutineData.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "name == %@", name)
            
            do {
                let existingRoutine = try context.fetch(fetchRequest).first
                
                if let routine = existingRoutine {
                    routine.goal = goal
                    try context.save()
                    self?.tableView.reloadData()
                    if let visibleIndexPaths = self?.tableView.indexPathsForVisibleRows {
                        for indexPath in visibleIndexPaths {
                            if let cell = self?.tableView.cellForRow(at: indexPath) as? RoutineTableViewCell {
                                if cell.routineName.text == name {
                                    cell.routineGoal.text = goal
                                    break
                                }
                            }
                        }
                    }
                } else {
                    self?.showAlert(title: "Error", message: "Routine not found")
                }
            } catch {
                self?.showAlert(title: "Error", message: "Data was not read.")
            }
        })
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        if let viewController = UIApplication.shared.windows.first?.rootViewController {
            viewController.present(alert, animated: true, completion: nil)
        }
        tableView.reloadData()
    }
}




extension RoutinePage: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RoutineTableViewCell", for: indexPath) as? RoutineTableViewCell else {
            fatalError("Library Table View Cell is not defined")
        }
        let routineData = dataSource[indexPath.row]
        
        let zikirIcone = UIImage(systemName: "circle.hexagonpath")
        let prayerIcone = UIImage(systemName: "link")
        let readingIcone = UIImage(systemName: "book")
        
        let nameRoutine = routineData.name
    
        let control = routineData.category
           cell.routineName.text = nameRoutine
           cell.routineGoal.text = routineData.goal
        if control == "Zikir" {
           cell.pickerView.isUserInteractionEnabled = false
           cell.iconeButton.setImage(zikirIcone, for: .normal)
           cell.iconeButton.tintColor = UIColor(hex: "FF2D55")
           cell.routineName.textColor = UIColor(hex: "FF2D55")
           cell.routineGoal.textColor = UIColor(hex: "FF2D55")
           updateZikirPickerView(picker: cell.pickerView, name: nameRoutine)
        } else if control == "Prayer" {
           cell.iconeButton.setImage(prayerIcone, for: .normal)
           cell.iconeButton.tintColor = UIColor(hex: "A838DB")
           cell.routineName.textColor = UIColor(hex: "A838DB")
           cell.routineGoal.textColor = UIColor(hex: "A838DB")
           updateOtherPickerView(picker: cell.pickerView, name: nameRoutine)
        } else {
           cell.iconeButton.setImage(readingIcone, for: .normal)
           cell.iconeButton.tintColor = UIColor(hex: "037AFE")
           cell.routineName.textColor = UIColor(hex: "037AFE")
           cell.routineGoal.textColor = UIColor(hex: "037AFE")
           updateOtherPickerView(picker: cell.pickerView, name: nameRoutine)
        }
        
        cell.leftButtonAction = {
            guard let name = cell.routineName.text else {return}
            self.UpdateRoutineGoalValue(name: name)
            self.tableView.reloadData()
        }
        
        cell.rightButtonAction = {
            if control == "Zikir" {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let ZikirVC = storyBoard.instantiateViewController(withIdentifier: "ZikirCounter") as! ZikirCounter
                self.navigationController?.pushViewController(ZikirVC, animated: true)
                guard let name = cell.routineName.text else {return}
                ZikirVC.zikirName = name
                ZikirVC.zikirControl = "counter"
            }
        }
        
        return cell
    }
    
    
    
    
    
    func updatePickerView(picker: UIPickerView, name: String) {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDateStr = dateFormatter.string(from: currentDate)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<RoutineData> = RoutineData.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        
        do {
            if let existingRoutine = try context.fetch(fetchRequest).first, let routineDateStr = existingRoutine.date {
                if let routineDate = dateFormatter.date(from: routineDateStr) {
                    let existingDateStr = dateFormatter.string(from: routineDate)
                    if existingDateStr == currentDateStr {
                        if let selectedNumber = Int(existingRoutine.today ?? "0"), let row = numbers.firstIndex(of: selectedNumber) {
                            picker.selectRow(row, inComponent: 0, animated: false)
                        }
                    } else {
                        picker.selectRow(0, inComponent: 0, animated: false)
                    }
                } else {
                    picker.selectRow(0, inComponent: 0, animated: false)
                }
            } else {
                picker.selectRow(0, inComponent: 0, animated: false)
            }
        } catch {
            print("Error: \(error)")
        }
    }

    func updateOtherPickerView(picker: UIPickerView, name: String) {
        updatePickerView(picker: picker, name: name)
       
    }

    func updateZikirPickerView(picker: UIPickerView, name: String) {
        updatePickerView(picker: picker, name: name)
       
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       70
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let routineToDelete = dataSource[indexPath.row]
            let routineName = routineToDelete.name
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequestRoutine = NSFetchRequest<RoutineData>(entityName: "RoutineData")
            fetchRequestRoutine.predicate = NSPredicate(format: "name == %@", routineName)
            
            let alert = UIAlertController(title: "Delete Zikir", message: "Do you want to delete this routine permanently?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .default) {  _ in
                do {
                    let resultsRoutine = try context.fetch(fetchRequestRoutine)
                    if let zikirRouting = resultsRoutine.first {
                        context.delete(zikirRouting)
                        try context.save()
                    }
                } catch {
                    print("Error: \(error)")
                }
                self.dataSource.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            })
            alert.addAction(UIAlertAction(title: "Cancel", style: .default))
            present(alert, animated: true, completion: nil)
            
            
        }else {
            showAlert(title: "Error", message: "I'm sorry, you cannot delete zikir from this tab.")
        }
    }
    
}
