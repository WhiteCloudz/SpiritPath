import UIKit
import CoreData

class HomePage: UIViewController, UIPopoverPresentationControllerDelegate{
    
    @IBOutlet var backroundView: UIView!
    @IBOutlet weak var zikirView: UIView!
    @IBOutlet weak var prayerView: UIView!
    @IBOutlet weak var readingView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var zikirChartView: UIView!
    @IBOutlet weak var prayerChartView: UIView!
    @IBOutlet weak var readingChartView: UIView!
    @IBOutlet weak var weeklyChartView: UIView!
    
    
    @IBOutlet weak var zikirGoalAndNow: UILabel!
    @IBOutlet weak var prayerGoalAndNow: UILabel!
    @IBOutlet weak var readingGoalAndNow: UILabel!
    
    var dataSourceRoutine = [Routine]()
    var dataSourceCounter = [ZikirData]()
    var routineChackDataSource = [Routine]()
    var popoverProgressBar = UIProgressView()
    var reminderChoise = ""
    

    var zikirNowValue = 0
    var zikirGoalValue = 0
    var prayerNowValue = 0
    var prayerGoalValue = 0
    var readingNowValue = 0
    var readingGoalValue = 0
    var allCategory:String?
    var isPopoverVisible = false
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
           return .portrait
       }

       override var shouldAutorotate: Bool {
           return false
       }

        override func viewDidLoad() {
            super.viewDidLoad()
    
            self.tabBarController?.tabBar.isHidden = false
            setupBackroundImageToVievController(imageNamed: "backround-5" , backroundView: backroundView)
            saveWeeklyOtherData()
            fetchGoalAndNowValue()
            setupTableView()
            routineReminderMessage()
        }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        fetchGoalAndNowValue()
        saveWeeklyOtherData()
        tableView.reloadData()
    }
    
    
    @IBAction func openSettingsAndTipPage(_ sender: Any) {
        openSettingsPopover()
    }
    

    
    func setupTableView(){
        tableView.register(UINib(nibName: "DailyZikirsChartTableViewCell", bundle: nil), forCellReuseIdentifier: "DailyZikirsChartTableViewCell")
        tableView.register(UINib(nibName: "WeeklyChartTableViewCell", bundle: nil), forCellReuseIdentifier: "WeeklyChartTableViewCell")
        tableView.register(UINib(nibName: "DailyPrayerChartTableViewCell", bundle: nil), forCellReuseIdentifier: "DailyPrayerChartTableViewCell")
        tableView.register(UINib(nibName: "DailyReadingChartTableViewCell", bundle: nil), forCellReuseIdentifier: "DailyReadingChartTableViewCell")
        tableView.register(UINib(nibName: "BuildYourRoutineTableViewCell", bundle: nil), forCellReuseIdentifier: "BuildYourRoutineTableViewCell")
        tableView.register(UINib(nibName: "randomAsmaTableViewCell", bundle: nil), forCellReuseIdentifier: "randomAsmaTableViewCell")
        tableView.register(UINib(nibName: "SettingsButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingsButtonTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
       
    }
    
}

extension HomePage: UITableViewDelegate, UITableViewDataSource {
     
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 6
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          if indexPath.row == 0 {
              let cell = tableView.dequeueReusableCell(withIdentifier: "DailyZikirsChartTableViewCell", for: indexPath) as! DailyZikirsChartTableViewCell
              for subview in cell.chartView.subviews {
                     subview.removeFromSuperview()
                 }
              let chartViewZikir = ChartView(frame: CGRect(x: 20, y: 25, width: 40, height: 55))
              chartViewZikir.backgroundColor = .clear
              chartViewZikir.data = [Double(zikirGoalValue), Double(zikirNowValue)]
              cell.chartView.addSubview(chartViewZikir)
              cell.goalAndNowValue.text = "\(String(describing: zikirGoalValue)) / \(String(describing: zikirNowValue))"
              cell.buttonAction = {
                  let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                  let ZikirVC = storyBoard.instantiateViewController(withIdentifier: "ZikirViewController") as! ZikirViewController
                  self.navigationController?.pushViewController(ZikirVC, animated: true)
              }
              return cell
          } else if indexPath.row == 1 {
              
              let cell = tableView.dequeueReusableCell(withIdentifier: "DailyPrayerChartTableViewCell", for: indexPath) as! DailyPrayerChartTableViewCell
              for subview in cell.chartView.subviews {
                     subview.removeFromSuperview()
                 }
              let chartViewZikir = ChartView(frame: CGRect(x: 20, y: 25, width: 40, height: 55))
              chartViewZikir.backgroundColor = .clear
              chartViewZikir.data = [Double(prayerGoalValue), Double(prayerNowValue)]
              cell.chartView.addSubview(chartViewZikir)
              
              cell.goalAndNowValue.text = "\(String(describing: prayerGoalValue)) / \(String(describing: prayerNowValue))"
              cell.buttonAction = {
                  let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                  let RoutineVC = storyBoard.instantiateViewController(withIdentifier: "RoutinePage") as! RoutinePage
                  self.navigationController?.pushViewController(RoutineVC, animated: true)
              }
              return cell
          
          }else if indexPath.row == 2 {
              let cell = tableView.dequeueReusableCell(withIdentifier: "DailyReadingChartTableViewCell", for: indexPath) as! DailyReadingChartTableViewCell
              for subview in cell.chartView.subviews {
                     subview.removeFromSuperview()
                 }
              let chartViewZikir = ChartView(frame: CGRect(x: 20, y: 25, width: 40, height: 55))
              chartViewZikir.backgroundColor = .clear
              chartViewZikir.data = [Double(readingGoalValue), Double(readingNowValue)]
              cell.chartView.addSubview(chartViewZikir)
              
              cell.goalAndNowValue.text = "\(String(describing: readingGoalValue)) / \(String(describing: readingNowValue))"
              cell.buttonAction = {
                  let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                  let RoutineVC = storyBoard.instantiateViewController(withIdentifier: "RoutinePage") as! RoutinePage
                  self.navigationController?.pushViewController(RoutineVC, animated: true)
              }
              return cell
              
           }else if indexPath.row == 3 {
                  let cell = tableView.dequeueReusableCell(withIdentifier: "WeeklyChartTableViewCell", for: indexPath) as! WeeklyChartTableViewCell
                  for subview in cell.weeklyChartView.subviews {
                      subview.removeFromSuperview()
                  }
                  let chartViewWeekly = AllZikirChartView(frame: CGRect(x: 45, y: 35, width: 275, height: 130))
               chartViewWeekly.backgroundColor = UIColor.clear
                  cell.weeklyChartView.addSubview(chartViewWeekly)
                  return cell
              }else if indexPath.row == 4 {
                  let cell = tableView.dequeueReusableCell(withIdentifier: "BuildYourRoutineTableViewCell", for: indexPath) as! BuildYourRoutineTableViewCell
                  cell.buttonAction = {
                      let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                      let RoutineVC = storyBoard.instantiateViewController(withIdentifier: "RoutinePage") as! RoutinePage
                      self.navigationController?.pushViewController(RoutineVC, animated: true)
                  }
                  return cell
              }else if indexPath.row == 5 {
                  let cell = tableView.dequeueReusableCell(withIdentifier: "randomAsmaTableViewCell", for: indexPath) as! randomAsmaTableViewCell
                  let randomIndex = asmaList[Int.random(in: 0..<asmaList.count)]
                  cell.asmaName.text = String(randomIndex.ZikirName)
                  cell.asmaDescription.text = String(randomIndex.ZikirDescription)
                  cell.buttonAction = {
                    let randomIndex = asmaList[Int.random(in: 0..<asmaList.count)]
                    cell.asmaName.text = String(randomIndex.ZikirName)
                    cell.asmaDescription.text = String(randomIndex.ZikirDescription)
                  }
                  return cell
                }
              return UITableViewCell()
          }
        
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 125
        } else if indexPath.row == 1 {
            return 125
        } else if indexPath.row == 2 {
            return 125
        }else if indexPath.row == 3 {
            return 220
        }else if indexPath.row == 4 {
            return 200
        }else if indexPath.row == 5 {
            return 330
        }
        return 125
    }
    
    func fetchGoalAndNowValue() {
        
         let currentDate = Date()
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "yyyy-MM-dd"
         let dateNow = dateFormatter.string(from: currentDate)
         
         dismiss(animated: true, completion: nil)
         
         let appDelegate = UIApplication.shared.delegate as! AppDelegate
         let context = appDelegate.persistentContainer.viewContext
         let fetchRequest: NSFetchRequest<RoutineData> = RoutineData.fetchRequest()
         
         zikirGoalValue = 0
         zikirNowValue = 0
         prayerGoalValue = 0
         readingGoalValue = 0
         prayerNowValue = 0
         readingNowValue = 0
         
         do {
             let Routines = try context.fetch(fetchRequest)
             
             for routine in Routines {
                 guard let goal = routine.goal, let category = routine.category, let today = routine.today, let date = routine.date else { continue }
                 allCategory = category
                 if let routineGoal = Int(goal), let routineToday = Int(today) {
                   
                        if category == "Zikir" {
                              zikirGoalValue += routineGoal
                           if date == dateNow {
                               zikirNowValue += routineToday
                         }else {
                             zikirNowValue = 0
                              }
                   } else if category == "Reading" {

                       readingGoalValue += routineGoal
                         if date == dateNow {
                             readingNowValue += routineToday
                         }else {
                             readingNowValue = 0
                         }
                     } else if category == "Prayer" {

                         prayerGoalValue += routineGoal
                         if date == dateNow {
                             prayerNowValue += routineToday
                         }else {
                             prayerNowValue = 0
                         }
                     } else {
                         
                     }
                 } else {
                 }
             }
             
         } catch {
             
         }
     }
    
    func saveWeeklyOtherData() {
        var otherTodayTotal = 0
        
        let currentDate = Date()
        let dayOfWeekFormatter = DateFormatter()
        dayOfWeekFormatter.dateFormat = "EEEE"
        let dayOfWeek = dayOfWeekFormatter.string(from: currentDate)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<DataOfWeek> = DataOfWeek.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "dayOfWeek == %@", dayOfWeek)
        let fetchRequestOther: NSFetchRequest<RoutineData> = RoutineData.fetchRequest()
        do {
            let others = try context.fetch(fetchRequestOther)
            for other in others {
                guard let totalOther = Int(other.today ?? "0"), let category = other.category else {return}
                if category != "Zikir"{
                    otherTodayTotal += totalOther
                }
            }
            
            let results = try context.fetch(fetchRequest)
            if let existingRoutine = results.first {
                existingRoutine.otherTotalValue = String(describing: otherTodayTotal)
                existingRoutine.dayOfWeek = dayOfWeek
                try context.save()

            } else {
                let newWeeklyData = DataOfWeek(context: context)
                newWeeklyData.otherTotalValue = String(describing: otherTodayTotal)
                newWeeklyData.dayOfWeek = dayOfWeek
                try context.save()
            }
        } catch {
            print("Hata: \(error.localizedDescription)")
        }
    }
}






