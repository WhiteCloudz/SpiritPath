//
//  SettingsPOpover.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 11/25/23.
//

import Foundation
import UIKit
import CoreData

extension HomePage{
   
    func openSettingsPopover(){
        dismiss(animated: true, completion: nil)
        
        let popoverContentController = UIViewController()
        
        let contentView = UIView(frame: CGRect(x: 180, y: 140, width: 280, height: 320))
        contentView.backgroundColor = .clear
        
        let userIcon = UIImageView()
        userIcon.frame = CGRect(x: 100, y: 45, width: 80, height: 80)
        userIcon.backgroundColor = .clear
        userIcon.image = UIImage(named: "homeImage")
        contentView.addSubview(userIcon)
        
        let description = UILabel()
        description.frame = CGRect(x: 20, y: 145, width: 240, height: 130)
        description.font = UIFont(name: "Hiragino Mincho ProN W6", size: 12.0)
        description.textAlignment = .center
        description.numberOfLines = 0
        description.text = "You can receive in-app reminders about your daily routine by using the switch under 'Routine Reminder'. You can also delete all stored data and restore your app to the state it was in when you first installed it by clicking the 'Factory Reset' button at the bottom of the page."
        description.textColor = .black
        contentView.addSubview(description)
        
        let reminderHourLeable = UILabel()
        reminderHourLeable.frame = CGRect(x: 30, y: 300, width: 220, height: 20)
        reminderHourLeable.font = UIFont(name: "Hiragino Mincho ProN W6", size: 18.0)
        reminderHourLeable.textAlignment = .center
        reminderHourLeable.text = "Routine Reminder"
        reminderHourLeable.textColor = UIColor(hex: "2FA1D6")
        contentView.addSubview(reminderHourLeable)
        
        let reminderSwitch = UISwitch()
        reminderSwitch.frame = CGRect(x: 115, y: 325, width: 50, height: 20)
        reminderSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        reminderSwitch.onTintColor = UIColor(hex: "2EA0D4")
        contentView.addSubview(reminderSwitch)
        updateSwitchValueFromCoreData(for: reminderSwitch)

        
        let factoryResetButton = UIButton(type: .system)
        factoryResetButton.frame = CGRect(x: 85, y: 400, width: 110, height: 25)
        factoryResetButton.backgroundColor = .clear
        factoryResetButton.tintColor = .red
        factoryResetButton.setTitle("Factory Reset", for: .normal)
        factoryResetButton.addTarget(self, action: #selector(showDeleteAlert), for: .touchUpInside)
        contentView.addSubview(factoryResetButton)
        
        popoverContentController.view = contentView
        popoverContentController.preferredContentSize = CGSize(width: 280, height: 450)
        popoverContentController.modalPresentationStyle = .popover
        if let popoverPresentationController = popoverContentController.popoverPresentationController {
            popoverPresentationController.permittedArrowDirections = .up
            popoverPresentationController.delegate = self
            popoverPresentationController.sourceView = self.view
            
            let contentWidth = 300
            let xOffset = (Int(view.bounds.width) - contentWidth) / 2
            popoverPresentationController.sourceRect = CGRect(x: xOffset, y: 35, width: contentWidth, height: 60)
            
            present(popoverContentController, animated: true, completion: nil)
        
        }
        
        isPopoverVisible = true
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
    
    @objc func switchValueChanged(_ sender: UISwitch) {
        saveSwitchValueToCoreData(switchValue: sender.isOn)
       
    }
    
    func saveSwitchValueToCoreData(switchValue: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<SwitchData> = SwitchData.fetchRequest()
        
        do {
            let result = try context.fetch(fetchRequest)
            if let existingData = result.first {
                existingData.switchValue = switchValue
            } else {
                let newData = SwitchData(context: context)
                newData.switchValue = switchValue
            }
            
            try context.save()
        } catch {
            print("Error: \(error)")
        }
    }
    
    func updateSwitchValueFromCoreData(for switchControl: UISwitch) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<SwitchData> = SwitchData.fetchRequest()
        
        do {
            let result = try context.fetch(fetchRequest)
            if let existingData = result.first {
                switchControl.isOn = existingData.switchValue
            } else {
                switchControl.isOn = false
            }
        } catch {
            print("Error: \(error)")
        }
    }
    
 
    
    @objc func showDeleteAlert (){
        dismiss(animated: true, completion: nil)
        let alert = UIAlertController(title: "Caution", message: "When you click the reset button, all your saved data will be permanently erased and cannot be recovered.", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(cancelAction)
        let goAction = UIAlertAction(title: "Reset", style: .default) { [weak self] _ in
            self?.areYouSure ()
        }
        alert.addAction(goAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func areYouSure(){
        dismiss(animated: true, completion: nil)
        let alert = UIAlertController(title: "Are You Sure", message: "", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(cancelAction)
        let goAction = UIAlertAction(title: "Yes", style: .default) { [weak self] _ in
            self?.deleteAllData()
            self?.fetchGoalAndNowValue()
            self?.tableView.reloadData()
        }
        alert.addAction(goAction)
        present(alert, animated: true, completion: nil)
      
    }
   
}
