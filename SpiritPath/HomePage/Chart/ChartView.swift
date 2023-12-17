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
    
    var color: String = "" { // Renk değerini bir String olarak saklayın
        didSet {
            setNeedsDisplay()
        }
    }
   
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawCircularProgress()
    }

    func drawCircularProgress() {
        subviews.forEach { $0.removeFromSuperview() }

        guard data.count == 2 else {
            return
        }

        let scaleFactor: CGFloat = 2.0
        let lineWidth: CGFloat = 7.0
        let centerPoint = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = (min(bounds.width, bounds.height) - lineWidth) / 4.0 * scaleFactor

        let totalProgress = CGFloat(data[0])
        let currentProgress = CGFloat(data[1])
        _ = currentProgress / totalProgress * 100

        let backgroundPath = UIBezierPath(arcCenter: centerPoint,
                                          radius: radius * 2,
                                          startAngle: -CGFloat.pi / 2,
                                          endAngle: 2 * CGFloat.pi,
                                          clockwise: true)

        let backgroundLayer = CAShapeLayer()
        backgroundLayer.path = backgroundPath.cgPath
        backgroundLayer.strokeColor = UIColor(hex: "04D3F5").cgColor
        backgroundLayer.fillColor = UIColor.clear.cgColor
        backgroundLayer.lineWidth = lineWidth * scaleFactor

        layer.addSublayer(backgroundLayer)

        let progressPath = UIBezierPath(arcCenter: centerPoint,
                                        radius: radius * 2,
                                        startAngle: -CGFloat.pi / 2,
                                        endAngle: 2 * CGFloat.pi * currentProgress / totalProgress - CGFloat.pi / 2,
                                        clockwise: true)

        let progressLayer = CAShapeLayer()
        progressLayer.path = progressPath.cgPath
        progressLayer.strokeColor = UIColor(hex: color).cgColor // Renk değerini UIColor'a dönüştürün
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineWidth = lineWidth * scaleFactor
        progressLayer.lineCap = .round

        layer.addSublayer(progressLayer)
        
        // Barların içine değerleri yazmak için metin katmanları
        let valueTextLayer = CATextLayer()
        valueTextLayer.font = UIFont(name: "Hiragino Mincho ProN W6", size: 0)
        valueTextLayer.fontSize = 10 * scaleFactor // Yazı boyutu artırıldı
        valueTextLayer.foregroundColor = UIColor(hex: "201B4D").cgColor
        valueTextLayer.alignmentMode = .center
        valueTextLayer.frame = CGRect(x: centerPoint.x - 20 * scaleFactor, y: centerPoint.y - 7 * scaleFactor, width: 40 * scaleFactor, height: 20 * scaleFactor)
    
        if totalProgress > 0 {
            let progressPercentage = currentProgress / totalProgress * 100
            valueTextLayer.string = "\(Int(progressPercentage))%"
        } else {
            valueTextLayer.string = "0%"
        }
    

        layer.addSublayer(valueTextLayer)
    }
}

