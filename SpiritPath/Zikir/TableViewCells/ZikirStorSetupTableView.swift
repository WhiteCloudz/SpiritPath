//
//  ZikirViewCounterSetupTableView.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 11/2/23.
//

import UIKit
import CoreData

extension ZikirViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            switch segmentedControl.selectedSegmentIndex {
            case 0:
                return counterData.count
            case 1:
                return asmaList.count
            case 2:
                return recomendList.count
            default:
                return 0
            }
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ZikirViewCell", for: indexPath) as! ZikirViewCell
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let Zikir = storyBoard.instantiateViewController(withIdentifier: "ZikirCounter") as! ZikirCounter

        var currentData: ZikirData?

        switch segmentedControl.selectedSegmentIndex {
        case 0:
            currentData = counterData[indexPath.row]
            currentData?.ZikirControl = "counter"
        case 1:
            currentData = asmaList[indexPath.row]
            currentData?.ZikirControl = "controlAsma"
        case 2:
            currentData = recomendList[indexPath.row]
            currentData?.ZikirControl = "controlZikir"
        default:
            break
        }
        
        if let data = currentData {
            cell.ConfigureCell(data) {
                self.navigationController?.pushViewController(Zikir, animated: true)
                Zikir.zikirName = data.ZikirName
                Zikir.zikirControl = data.ZikirControl
                Zikir.zikirRecomended = data.ZikirRecomend
            }
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if segmentedControl.selectedSegmentIndex == 0 {
            if editingStyle == .delete {
                let zikirToDelete = counterData[indexPath.row]
                let zikirName = zikirToDelete.ZikirName
                
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context = appDelegate.persistentContainer.viewContext
                
                let fetchRequestRoutine = NSFetchRequest<RoutineData>(entityName: "RoutineData")
                fetchRequestRoutine.predicate = NSPredicate(format: "name == %@", zikirName)
                
                let alert = UIAlertController(title: "Delete Zikir", message: "Do you want to delete this zikir permanently?", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Yes", style: .default) {  _ in
                    do {
                        let resultsZikir = try context.fetch(fetchRequestRoutine)
                        if let zikirRouting = resultsZikir.first {
                            context.delete(zikirRouting)
                            try context.save()
                            self.counterData.remove(at: indexPath.row)
                            tableView.deleteRows(at: [indexPath], with: .fade)
                        } else {
                            print("Zikir Not Fount")
                        }
                    } catch {
                        self.showAlert(title: "Error", message: "An error occurred while deleting the zikir.")
                    }
                })
                alert.addAction(UIAlertAction(title: "Cancel", style: .default))
                present(alert, animated: true, completion: nil)
            }
        } else {
            showAlert(title: "Error", message: "This tab cannot be deleted")
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      115
        
        }
    
    func ToolTipMessage(){
        let isPopupShown = UserDefaults.standard.bool(forKey: "popupShown")
        if !isPopupShown {
            let alert = UIAlertController(title: "Tooltip", message: "To add a new dhikr, click on the + button you see on the screen.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alert, animated: true, completion: nil)
            UserDefaults.standard.set(true, forKey: "popupShown")
        }
    }
}
