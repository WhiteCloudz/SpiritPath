
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

        let today = Date()
        let calendar = Calendar.current
        let currentWeekday = calendar.component(.weekday, from: today) - 1 // Adjust to match array index
        let currentDay = calendar.component(.day, from: today)

        for index in 0...currentWeekday {
            let dayOfWeek = weekdays[index]

            let fetchRequest: NSFetchRequest<DataOfWeek> = DataOfWeek.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "dayOfWeek == %@", dayOfWeek)

            do {
                let results = try context.fetch(fetchRequest)
                if let existingRoutine = results.first {
                    if let totalValue = Double(existingRoutine.totalValue ?? "0") {
                        weeklyData[index] = totalValue
                    }
                }
            } catch {
                print("Hata: \(error.localizedDescription)")
            }
        }

        // Hide future days if necessary
        if currentDay < weeklyData.count {
            for index in currentDay..<weeklyData.count {
                weeklyData[index] = 0.0
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

        let maxValue = data.max() ?? 0

        for (index, value) in data.enumerated() {
            let x = CGFloat(index) * barWidth
            let barHeight = (bounds.height * CGFloat(value) / CGFloat(maxValue))

            let dayLabel = UILabel()
            let chartLabels = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
            if index < chartLabels.count {
                dayLabel.text = chartLabels[index]
            }
            dayLabel.font = UIFont.systemFont(ofSize: 12)
            dayLabel.textColor = UIColor.black
            dayLabel.textAlignment = .center
            dayLabel.frame = CGRect(x: x, y: yOffset, width: barWidth, height: 20)
            addSubview(dayLabel)

            let correctedBarHeight = barHeight.isNaN ? 0 : barHeight

            let circlePath = UIBezierPath(roundedRect: CGRect(x: x + barWidth / 4, y: yOffset - correctedBarHeight, width: barWidth / 2, height: correctedBarHeight), cornerRadius: barWidth / 4)
            let fillColor = colors[index % colors.count].withAlphaComponent(1.0)

            let shapeLayer = CAShapeLayer()
            shapeLayer.path = circlePath.cgPath
            shapeLayer.fillColor = fillColor.cgColor
            layer.addSublayer(shapeLayer)

            let label = UILabel()
            label.text = "\(Int(value))"
            label.font = UIFont.systemFont(ofSize: 12)
            label.textColor = UIColor.black
            label.textAlignment = .center
            label.frame = CGRect(x: x, y: yOffset - correctedBarHeight - 20, width: barWidth, height: 20)
            addSubview(label)

            // Çizimin ekranı yenilemesi için animasyon ekleme
            let animation = CABasicAnimation(keyPath: "path")
            animation.fromValue = UIBezierPath(roundedRect: CGRect(x: x + barWidth / 4, y: yOffset, width: barWidth / 2, height: 0), cornerRadius: barWidth / 4).cgPath
            animation.toValue = circlePath.cgPath
            animation.duration = 0.5
            shapeLayer.add(animation, forKey: "path")
        }
    }
}
