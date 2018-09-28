//
//  Vendors.swift
//  Trofi
//
//  Created by Dhrumil Shah on 2017-08-16.
//  Copyright © 2017 makeschool. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot
import UIKit
import SwiftyJSON

class Vendors {
    
    var priceRange: String
    var type: String
    var vendorName: String
    var distance: String
    var priceLabel: String
    var servingsNumber: String
    var name: String

    
    
    init(json:JSON) {
        self.priceRange = json["priceRange"].stringValue
        self.type = json["type"].stringValue
        self.vendorName = json["vendorName"].stringValue
        self.distance = json["distance"].stringValue
        self.priceLabel = json["Menu"]["name"].stringValue
        self.name = json["Menu"]["price"].stringValue
        self.servingsNumber = json["Menu"]["servings"].stringValue

    }
    
}



