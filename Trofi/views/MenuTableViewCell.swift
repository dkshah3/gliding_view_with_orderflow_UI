//
//  MenuTableViewCell.swift
//  Trofi
//
//  Created by Dhrumil Shah on 2017-07-25.
//  Copyright © 2017 makeschool. All rights reserved.
//


import UIKit

class MenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var discount: UILabel!

    @IBOutlet weak var timer: ClockUILabel!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var servings: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var servingsNumber: UILabel!

}
