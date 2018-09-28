//
//  Menu.swift
//  Trofi
//
//  Created by Dhrumil Shah on 2017-08-20.
//  Copyright © 2017 makeschool. All rights reserved.
//


import Foundation
import FirebaseDatabase.FIRDataSnapshot
import UIKit
import SwiftyJSON

class Menu {
    
    var name: String
    var priceLabel: String
    var servingsNumber: Int
    
    
    init(json:JSON) {
        self.priceLabel = json["Menu"]["name"].stringValue
        self.name = json["Menu"]["price"].stringValue
        self.servingsNumber = json["Menu"]["servings"].intValue
    }
    
}



