//
//  Event.swift
//  Tonight
//
//  Created by Rohan Tyagi on 9/21/22.
//

import Foundation

struct Event{
    var name: String
    var description: String
    var startTime: Date = Date()
    var amountPeople: Int = 0
    
    init(name: String, description: String, startTime: Date, amountPeople: Int){
        self.name = name
        self.description = description
        self.startTime = startTime
        self.amountPeople = amountPeople
    }
    
    
    
}
