//
//  Routine.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 11/6/23.
//

import Foundation

class Routine {
    
    var category:String
    var date:String
    var goal:String
    var name:String
    var today:String
    
    init(category: String, date: String, goal: String, name: String, today: String) {
        self.category = category
        self.date = date
        self.goal = goal
        self.name = name
        self.today = today
    }
}
