//
//  RoutineTableViewCell.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 11/6/23.
//

import UIKit
import CoreData


class RoutineTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var iconeButton: UIButton!
    @IBOutlet weak var routineName: UILabel!
    @IBOutlet weak var routineGoal: UITextField!
    @IBOutlet weak var routineNow: UILabel!
    @IBOutlet weak var goZikirButton: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var steckView: UIStackView!
    var updateButtonAction: (() -> Void)?
    var goZikirButtonAction: (() -> Void)?
   
    let customFont = UIFont(name: "Hiragino Mincho ProN W6", size: 15.0)
    let numbers = Array(0...10000)
    var pickerData =  [Routine]()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        pickerView.dataSource = self
        pickerView.delegate = self
        routineGoal.isUserInteractionEnabled = false
        routineName.isUserInteractionEnabled = false
        pickerView.layer.cornerRadius = pickerView.bounds.height / 5
        steckView.layer.cornerRadius = steckView.bounds.height / 5
        steckView.backgroundColor = UIColor.blue.withAlphaComponent(0.1)
    }
     


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    func configureCell(_ Routine : Routine, buttonAction: (() -> Void)?){
        routineName.text = Routine.name
        routineGoal.text = Routine.goal
        self.updateButtonAction = buttonAction
        self.goZikirButtonAction = buttonAction
    }
    
    
    @IBAction func goToZikirController(_ sender: Any) {
        goZikirButtonAction?()
    }
    
    
    @IBAction func LeftButtonTapped(_ sender: Any) {
        updateButtonAction?()
    }
    
  
}



extension RoutineTableViewCell: UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numbers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(numbers[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedNumber = numbers[row]
        guard let cellName = routineName.text else {return}
        saveSelectedNumberToCoreData(cellName, selectedNumber)
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        label.font = UIFont(name: "Hiragino Mincho ProN W6", size: 15.0)
        label.textAlignment = .center
        label.text = String(numbers[row])
        return label
    }
    
    
    func saveSelectedNumberToCoreData(_ cellName: String, _ selectedNumber: Int) {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.string(from: currentDate)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<RoutineData> = RoutineData.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", cellName)
        
        do {
            if let existingRoutine = try context.fetch(fetchRequest).first {
                let category = existingRoutine.category
                if category != "Zikir"{
                    existingRoutine.today = String(selectedNumber)
                    existingRoutine.date = date
                } else {
                    existingRoutine.today = existingRoutine.today
                    existingRoutine.date = date
                }
                try context.save()
            }
        } catch {
            print("Not Macth")
        }
    }
    
}
    
    
