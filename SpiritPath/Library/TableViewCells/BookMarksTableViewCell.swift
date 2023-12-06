//
//  BookMarksTableViewCell.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 11/19/23.
//

import UIKit

class BookMarksTableViewCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var bookName: UILabel!
    @IBOutlet weak var bookPage: UILabel!
    @IBOutlet weak var bookDescription: UILabel!
    
    var buttonAction: (() -> Void)?
    let button: UIButton = {
           let button = UIButton(type: .system)
           button.translatesAutoresizingMaskIntoConstraints = false
           return button
       }()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.addSubview(button)
                button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
                button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
                button.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
                button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
                button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        view.layer.cornerRadius = stackView.bounds.height / 5
        stackView.layer.cornerRadius = stackView.bounds.height / 5
        stackView.backgroundColor = .clear
        view.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.1)
      
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    func ConfigureCell(_ Popover : Popover, buttonAction: (() -> Void)?){
        
        bookName.text = Popover.bookName
        bookDescription.text = Popover.bookDescription
        bookPage.text = Popover.bookPage
      
        
        self.buttonAction = buttonAction
        
    }
    
    @objc func buttonTapped() {
        print("butona tiklandi")
            buttonAction?()
        }
    
}
