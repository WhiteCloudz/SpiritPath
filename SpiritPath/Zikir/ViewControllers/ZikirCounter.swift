
//  EsmaZikir.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 17.08.2023.
//

import UIKit
import CoreData

struct Update {
    var name:String
    var total:String
    var today:String
    var date:String
}

class ZikirCounter: UIViewController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
           return .portrait
       }

       override var shouldAutorotate: Bool {
           return false
       }
    
    @IBOutlet weak var backroundView: UIView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var tappedButton: UIButton!
    @IBOutlet weak var zikirImageView: UIImageView!
    @IBOutlet weak var zikirImageViewDown: UIImageView!
    @IBOutlet weak var zikirTodayUp: UILabel!
    @IBOutlet weak var zikirTotalUp: UILabel!
    @IBOutlet weak var zikirNameUp: UILabel!
    @IBOutlet weak var zikirNameDown: UILabel!
    @IBOutlet weak var zikirTodayDown: UILabel!
    @IBOutlet weak var zikirTotalDown: UILabel!
    @IBOutlet weak var recomendZikir: UILabel!
    @IBOutlet weak var addZikirAmountButton: UIButton!
    @IBOutlet weak var asmaZikirDescription: UITextView!
    
    var updateDataClosure: (() -> Void)?
    var custom:String?
    var zikirName:String?
    var zikirCount:String?
    var zikirRecomended:String?
    var zikirControl:String?
    var totalZikir:Int = 0
    var todayZikir:Int = 0
    var allDailyZikir:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackroundImageToVievController(imageNamed: "backround-3" , backroundView: backroundView)

        guard let imageName = zikirName else {return}
        setImage(imageName: imageName, textView: asmaZikirDescription, imageView: zikirImageView)
        setupView()
        SetRecomendText ()
        fetchWeeklyData()
        print(allDailyZikir)
    }
    
    func setupView(){
        setupCornerRadius()
        setupCounterView()
        setupCallSavedData()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        ToolTipMessage()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        setupSavedData()
        saveWeeklyData()
      
    }
    
    func setupSavedData(){
        if zikirControl == "counter" {
            savedUpdateCounterData()
        }else {
            savedOtherZikirDataToNSUserDefault()
        }
    }
    
    
    func setupCallSavedData(){
        if zikirControl == "counter" {
            fetchCounterDataAndSetCounter()
        }else {
            callSavedOtherData()
            
        }
    }
    
    func setupCounterView(){
        switch zikirControl {
        case "counter":
            zikirImageView.isHidden = true
            zikirTotalDown.isHidden = true
            zikirTodayDown.isHidden = true
            recomendZikir.isHidden = true
            asmaZikirDescription.isHidden = true
        case "controlZikir":
            recomendZikir.isHidden = true
            zikirTotalUp.isHidden = true
            zikirTodayUp.isHidden = true
            asmaZikirDescription.isHidden = true
        default:
            zikirTotalUp.isHidden = true
            zikirTodayUp.isHidden = true
            zikirNameUp.text = zikirName
           
        }
    }
    
    
    @IBAction func TappedButton(_ sender: Any) {
        totalZikir += 1
        todayZikir += 1
        allDailyZikir += 1
        updateDataClosure?()
        if zikirControl == "counter" {
            zikirTodayUp.text = String(describing: todayZikir)
            zikirTotalUp.text = String(describing: totalZikir)
        } else{
            zikirTodayDown.text = String(describing: todayZikir)
            zikirTotalDown.text = String(describing: totalZikir)
        }
        let sound = UIImpactFeedbackGenerator(style: .medium)
        sound.impactOccurred()
        SetRecomendText ()
    }
    
    
    @IBAction func setupAddZikirAmountButton(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add Zikir Amount", message: "Please enter the amount of zikir you want to add.", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Amount of Zikir"
            textField.keyboardType = .numberPad
        }
       
        alert.addAction(UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            guard let self = self,
                  let zikirAmount = alert.textFields?.first?.text, !zikirAmount.isEmpty else {
                self?.showAlert(title: "Error", message: "Please make sure all fields are completed")
                return}
            if zikirAmount.count > 8 {
                self.showAlert(title: "Error", message: "You can enter a number of up to 8 digits.")
            }else {
                guard let amount = Int(zikirAmount) else {return}
                
                self.totalZikir += amount
                self.todayZikir += amount
                self.allDailyZikir += amount
                zikirTodayUp.text = String(describing: todayZikir)
                zikirTotalUp.text = String(describing: totalZikir)
                zikirTodayDown.text = String(describing: todayZikir)
                zikirTotalDown.text = String(describing: totalZikir)
            }
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func resetCounter(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            let alert = UIAlertController(title: "Reset Counter", message: "To reset the counter, click on the reset button.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Reset", style: .default) { [weak self] _ in
                self?.zikirTodayUp.text = "0"
                self?.zikirTotalUp.text = "0"
                self?.zikirTodayDown.text = "0"
                self?.zikirTotalDown.text = "0"
                self?.allDailyZikir = 0
                self?.totalZikir = 0
                self?.todayZikir = 0
                
            })
            alert.addAction(UIAlertAction(title: "Cancel", style: .default))
            present(alert, animated: true, completion: nil)
        }
    }
    
    func fetchCounterDataAndSetCounter() {
        
        guard let nameZikir = zikirName else {return}
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<RoutineData>(entityName: "RoutineData")
        fetchRequest.predicate = NSPredicate(format: "name = %@", nameZikir)
        
        do {
            let NewZikir = try context.fetch(fetchRequest)
            
            for zikir in NewZikir {
                guard let zikirName = zikir.name,
                      let zikirDate = zikir.date,
                      let zikirTotal = zikir.total,
                      let zikirToday = zikir.today else {return}
                guard let total = Int(zikirTotal), let today = Int(zikirToday) else {return}
                
                controlTodayDate(zikirDate:zikirDate, today:zikirToday, todayInt:today)
                zikirNameUp.text = zikirName
                zikirTotalUp.text = zikirTotal
                totalZikir = total
             
                
            }
            
        } catch {
            
        }
    }

   
    
    func savedUpdateCounterData() {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateNow = dateFormatter.string(from: currentDate)
        
        guard let name = zikirName,
              let counterTotal = zikirTotalUp.text,
              let counterToday = zikirTodayUp.text else {return}
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        if zikirControl == "counter" {
            let fetchRequest: NSFetchRequest<RoutineData> = RoutineData.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "name == %@", name)
            
            do {
                if let zikir = try context.fetch(fetchRequest).first {
                    zikir.today = counterToday
                    zikir.total = counterTotal
                    zikir.date = dateNow
                    
                    try context.save()
                    print("Data updated successfully")
                } else {
                    showAlert(title: "Error", message: "Data not found for \(name)")
                }
            } catch {
                showAlert(title: "Error", message: "Data could not be saved.")
            }
        }
    }
    
    func savedOtherZikirDataToNSUserDefault() {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let controlDate = dateFormatter.string(from: currentDate)
        
        guard let total = zikirTotalDown.text,
              let today = zikirTodayDown.text,
              let zikirName = zikirName else {
            return
        }
        let CounterKey = "zikir_\(zikirName)"
        
        let savedData: [String: String] = [
            "totalZikir": total,
            "todayZikir": today,
            "zikirName": zikirName,
            "zikirDate": controlDate
        ]
        UserDefaults.standard.set(savedData, forKey: CounterKey)
    }
    
    func callSavedOtherData() {
        guard let zikirName = zikirName else {
            return
        }
        
        let CounterKey = "zikir_\(zikirName)"
        
        if let savedData = UserDefaults.standard.dictionary(forKey: CounterKey) as? [String: String] {
            
            if let zikirTotal = savedData["totalZikir"],
               let zikirToday = savedData["todayZikir"],
               let zikirDate = savedData["zikirDate"],
               let total = Int(zikirTotal),
               let today = Int(zikirToday) {
                zikirTotalDown.text = zikirTotal
                controlTodayDate(zikirDate: zikirDate, today: zikirToday, todayInt: today)
                recomendZikir.text = zikirRecomended
                totalZikir = total
                setImage(imageName: zikirName, textView: asmaZikirDescription, imageView: zikirImageView)
            }
        } else {
            zikirTotalDown.text = zikirCount
            zikirTodayDown.text = "0"
            totalZikir = 0
            todayZikir = 0
            setImage(imageName: zikirName, textView: asmaZikirDescription, imageView: zikirImageView)
        }
    }
    
    func SetRecomendText () {
        if zikirControl == "controlAsma"{
            zikirNameDown.text = "The recommended amount of zikir."
            recomendZikir.text = zikirRecomended
        }
    }
   
    
    func ToolTipMessage(){
        let isPopupShown = UserDefaults.standard.bool(forKey: "popupShown")
        if !isPopupShown {
            let alert = UIAlertController(title: "Tooltip", message: "To reset the counter, simply press and hold the button for two seconds.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alert, animated: true, completion: nil)
            UserDefaults.standard.set(true, forKey: "popupShown")
        }
    }
    
    
    @IBAction func openBook(_ sender: Any){
        guard let name = zikirName else {return}
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let ReadBookPageVC = storyBoard.instantiateViewController(withIdentifier: "ReadBookPage") as! ReadBookPage
        
        switch name {
        case "Azkar al Sabah wal Masaa":
            self.navigationController?.pushViewController(ReadBookPageVC, animated: true)
            ReadBookPageVC.bookText = "Azkar al Sabah wal Masaa"
        case "Sekine":
            self.navigationController?.pushViewController(ReadBookPageVC, animated: true)
            ReadBookPageVC.bookText = "Sekine"
        case "Surah-al Yaseen":
            self.navigationController?.pushViewController(ReadBookPageVC, animated: true)
            ReadBookPageVC.bookText = "Yasin-i Serif"
        case "Surah-al Feth":
            self.navigationController?.pushViewController(ReadBookPageVC, animated: true)
            ReadBookPageVC.bookText = "Fetih Suresi"
        default:
            setImage(imageName: name, textView: asmaZikirDescription, imageView: zikirImageView)
        }
    }
    
    func setupCornerRadius(){
        firstView.layer.cornerRadius = firstView.bounds.height / 30
        secondView.layer.cornerRadius = secondView.bounds.height / 30
    }
    
    func controlTodayDate(zikirDate:String, today:String, todayInt:Int){
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let controlDate = dateFormatter.string(from: currentDate)
        
        if zikirDate == controlDate {
            zikirTodayUp.text = today
            zikirTodayDown.text = today
            todayZikir = todayInt
            allDailyZikir = todayInt
        }else {
            zikirTodayUp.text = "0"
            zikirTodayDown.text = "0"
            todayZikir = 0
            allDailyZikir = 0
        }
        
    }
 
    
    func setupZikirNameDownLabel (recomend:String){
        switch zikirControl {
        case "controlAsma":
            zikirNameDown.text = "Recommended amount of zikir"
            recomendZikir.text = recomend
        case "controlZikir":
            zikirNameDown.text = ""
            recomendZikir.text = ""
        default:
            zikirNameDown.text = ""
            recomendZikir.text = ""
            zikirNameUp.text = zikirName
        }
    }
    
    func saveWeeklyData() {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let dayOfWeekFormatter = DateFormatter()
        dayOfWeekFormatter.dateFormat = "EEEE"
        let dayOfWeek = dayOfWeekFormatter.string(from: currentDate)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<DataOfWeek> = DataOfWeek.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "dayOfWeek == %@", dayOfWeek)
        
        do {
            let results = try context.fetch(fetchRequest)
            if let existingRoutine = results.first {
                existingRoutine.totalValue = String(describing: allDailyZikir)
                existingRoutine.dayOfWeek = dayOfWeek
                try context.save()
            } else {
                let newWeeklyData = DataOfWeek(context: context)
                newWeeklyData.totalValue = String(describing: allDailyZikir)
                newWeeklyData.dayOfWeek = dayOfWeek
                try context.save()
            }
        } catch {
            print("Hata: \(error.localizedDescription)")
        }
    }
    
    func fetchWeeklyData(){
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let dayOfWeekFormatter = DateFormatter()
        dayOfWeekFormatter.dateFormat = "EEEE"
        let dayOfWeek = dayOfWeekFormatter.string(from: currentDate)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<DataOfWeek> = DataOfWeek.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "dayOfWeek == %@", dayOfWeek)
        
        do {
            let results = try context.fetch(fetchRequest)
            if let existingRoutine = results.first {
                let total = Int(existingRoutine.totalValue ?? "0")
                allDailyZikir = total ?? 0
            }
        } catch {
            print("Hata: \(error.localizedDescription)")
        }
        
    }
    
    
    
}



