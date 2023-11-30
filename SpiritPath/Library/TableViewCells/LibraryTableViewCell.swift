//
//  LibraryTableViewCell.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 17.08.2023.
//

import UIKit

class LibraryTableViewCell: UITableViewCell {


    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var currentAndTotalPage: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    
    var buttonAction: (() -> Void)?
    let button: UIButton = {
           let button = UIButton(type: .system)
           button.translatesAutoresizingMaskIntoConstraints = false
           return button
       }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        stackView.layer.cornerRadius = stackView.bounds.height / 12
        bookImage.layer.cornerRadius = bookImage.bounds.height / 12
        stackView.backgroundColor = UIColor.systemBrown.withAlphaComponent(0.4)
        
          
          self.bookTitle.numberOfLines = 0
          self.bookTitle.adjustsFontSizeToFitWidth = true
          self.bookTitle.minimumScaleFactor = 0.5
        
        
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
    func configureCell(_ library : Library, buttonAction: (() -> Void)?){
        bookTitle.text = library.bookTitle
        currentAndTotalPage.text = library.currentAndTotal
        bookImage.image = library.bookImage
        self.buttonAction = buttonAction
    }
    
    @objc func buttonTapped() {
            buttonAction?()
        }
}
