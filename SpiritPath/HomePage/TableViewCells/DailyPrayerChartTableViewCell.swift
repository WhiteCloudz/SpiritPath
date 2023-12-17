//
//  DailyPrayerChartTableViewCell.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 11/18/23.
//

import UIKit

class DailyPrayerChartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var goalAndNowValue: UILabel!
    @IBOutlet weak var chartView: UIView!
    @IBOutlet weak var steckView: UIStackView!
    
    var buttonAction: (() -> Void)?
    let button: UIButton = {
    let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
    return button
   }()

    override func awakeFromNib() {
        super.awakeFromNib()
        steckView.layer.cornerRadius = steckView.bounds.height / 10
        steckView.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.1)
        
        contentView.addSubview(button)
        button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        button.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func configureCell(_ Report : Report, buttonAction: (() -> Void)?){

        goalAndNowValue.text = " \(String(describing: Report.goalValue)) / \(String(describing: Report.nowValue))"
        self.buttonAction = buttonAction
    }
    
    @objc func buttonTapped() {
            buttonAction?()
        }
    
    
}
