//
//  ZikirViewCell.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 9/6/23.
//

import UIKit

class ZikirViewCell: UITableViewCell {
    
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var ZikirName: UILabel!
    @IBOutlet weak var zikirTodayAndTotal: UILabel!

    
    
    var buttonAction: (() -> Void)?
    let button: UIButton = {
           let button = UIButton(type: .system)
           button.translatesAutoresizingMaskIntoConstraints = false
           return button
       }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.ZikirName.adjustsFontSizeToFitWidth = true
       
        contentView.addSubview(button)
                button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
                button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
                button.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
                button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
                button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        stackView.layer.cornerRadius = stackView.bounds.height / 8
        stackView.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.2)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
  
    
    func ConfigureCell(_ ZikirData : ZikirData, buttonAction: (() -> Void)?){
        let todayAndTotal = "\(ZikirData.ZikirToday) / \(ZikirData.ZikirTotal)"
        ZikirName.text = ZikirData.ZikirName
        zikirTodayAndTotal.text = todayAndTotal
        self.buttonAction = buttonAction
        
    }
    
    
    @objc func buttonTapped() {
            buttonAction?()
        }
}
