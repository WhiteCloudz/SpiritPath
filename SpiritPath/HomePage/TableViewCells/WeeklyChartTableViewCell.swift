//
//  WeeklyChartTableViewCell.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 11/18/23.
//

import UIKit

class WeeklyChartTableViewCell: UITableViewCell {

    @IBOutlet weak var steckView: UIStackView!
    @IBOutlet weak var weeklyChartView: UIView!
    var buttonAction: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        steckView.layer.cornerRadius = steckView.bounds.height / 12    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }
    
    func configureCell(_ Report : Report, buttonAction: (() -> Void)?){

    }
    
}
