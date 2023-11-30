//
//  Lıbrary.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 7.08.2023.
//

import Foundation
import UIKit

class Library{
    var bookImage:UIImage?
    var bookTitle:String
    var currentAndTotal:String
    
    init(bookImage: UIImage? = nil, bookTitle: String, currentAndTotal: String) {
        self.bookImage = bookImage
        self.bookTitle = bookTitle
        self.currentAndTotal = currentAndTotal
    }
   
}
