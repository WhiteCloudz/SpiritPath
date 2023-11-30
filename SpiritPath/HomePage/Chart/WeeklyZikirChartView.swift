import UIKit
import CoreData

class AllZikirChartView: UIView {
    var data = [Double]() {
        didSet {
            setNeedsDisplay()
        }
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        fetchAndDrawChart()
    }
    
    func fetchAndDrawChart() {
        data = fetchWeeklyData()
        drawChart()
    }
    
    func fetchWeeklyData() -> [Double] {
        let weekdays = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
        var weeklyData = [Double](repeating: 0.0, count: 7)

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = Locale(identifier: "en_US")

        for index in 0..<weekdays.count {
            let dayOfWeek = weekdays[index]
            
            let fetchRequest: NSFetchRequest<DataOfWeek> = DataOfWeek.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "dayOfWeek == %@", dayOfWeek)
            
            do {
                let results = try context.fetch(fetchRequest)
                if let existingRoutine = results.first {
                    if let totalValue = Double(existingRoutine.totalValue ?? "0"), let otherTotalValue = Double(existingRoutine.otherTotalValue ?? "0") {
                        
                        let combinedValue = totalValue + otherTotalValue
                        weeklyData[index] = combinedValue
                    }
                }
            } catch {
                print("Hata: \(error.localizedDescription)")
            }
        }
        
        return weeklyData
    }
    
    func drawChart() {
        subviews.forEach { $0.removeFromSuperview() }
        
        guard data.count == 7 else {
            return
        }
        backgroundColor = UIColor.clear

        let barWidth = bounds.width / CGFloat(data.count)
        let yOffset = bounds.height

        let colors: [UIColor] = [UIColor(hex: "32ACE5"), UIColor(hex: "FF8A00"), UIColor(hex: "03C6BE"), UIColor(hex: "FF2D55"), UIColor(hex: "AE51DD"), UIColor(hex: "98D6F2"), UIColor(hex: "FF4900")]

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        let calendar = Calendar.current
        dateFormatter.calendar = calendar
        
        let chart: [String] = dateFormatter.shortWeekdaySymbols.prefix(7).map { String($0.prefix(3)) }

        let maxValue = data.max() ?? 0

        for (index, value) in data.enumerated() {
            let x = CGFloat(index) * barWidth
            let barHeight = (bounds.height * CGFloat(value) / CGFloat(maxValue))

            let dayLabel = UILabel()
            if index < chart.count {
                dayLabel.text = String(chart[index])
            }
            dayLabel.font = UIFont.systemFont(ofSize: 12)
            dayLabel.textColor = UIColor.black
            dayLabel.textAlignment = .center
            dayLabel.frame = CGRect(x: x, y: yOffset, width: barWidth, height: 20)
            addSubview(dayLabel)

            let correctedBarHeight = barHeight.isNaN ? 0 : barHeight

            let rect = CGRect(x: x, y: yOffset - correctedBarHeight, width: barWidth, height: correctedBarHeight)
            let barPath = UIBezierPath(rect: rect)
            let fillColor = colors[index % colors.count].withAlphaComponent(1.0)
            barPath.fill(with: .clear, alpha: 1.0)

            fillColor.setFill()
            barPath.fill()

            let label = UILabel()
            label.text = "\(Int(value))"
            label.font = UIFont.systemFont(ofSize: 12)
            label.textColor = UIColor.black
            label.textAlignment = .center

            label.frame = CGRect(x: x, y: yOffset - correctedBarHeight - 20, width: barWidth, height: 20)
            addSubview(label)
        }
    }
}
