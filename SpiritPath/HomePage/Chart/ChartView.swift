//
//  ChartView.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 10/30/23.
//

import UIKit

class ChartView: UIView {

    var data = [Double]() {
        didSet {
            setNeedsDisplay()
        }
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawChart()
    }

    func drawChart() {
        
        subviews.forEach { $0.removeFromSuperview() }

        guard data.count == 2 else {
            return
        }

        let barWidth = bounds.width / CGFloat(data.count)
        let yOffset = bounds.height

        let colors: [UIColor] = [UIColor(hex: "038EFC"), UIColor(hex: "04D3F5")]
        let chart = ["Goal", "Now"]

        let maxValue = max(data[0], data[1])

        for (index, value) in data.enumerated() {
            let x = CGFloat(index) * barWidth
            let barHeight = (bounds.height * CGFloat(value) / CGFloat(maxValue))

            let rect = CGRect(x: x, y: yOffset - barHeight, width: barWidth, height: barHeight)
            let barPath = UIBezierPath(rect: rect)
            let fillColor = colors[index].withAlphaComponent(1.0)
            barPath.fill(with: .clear, alpha: 1.0)

            fillColor.setFill()
            barPath.fill()

            let label = UILabel()
            label.text = chart[index]
            label.font = UIFont.systemFont(ofSize: 8)
            label.textColor = UIColor.black
            label.textAlignment = .center
            label.frame = CGRect(x: x, y: yOffset, width: barWidth, height: 20)
            addSubview(label)

           
            let valueLabel = UILabel()
            valueLabel.text = "\(Int(value))"
            valueLabel.font = UIFont.systemFont(ofSize: 8)
            valueLabel.textColor = UIColor.black
            valueLabel.textAlignment = .center
            valueLabel.frame = CGRect(x: x, y: (value > 0) ? yOffset - barHeight - 20 : yOffset - 20, width: barWidth, height: 20)
            addSubview(valueLabel)
        }
    }
}


