//
//  DemoCell.swift
//  Trofi
//
//  Created by Dhrumil Shah on 2017-07-22.
//  Copyright © 2017 makeschool. All rights reserved.
//

import UIKit
import FoldingCell
import Firebase
import MapKit
import CoreLocation

class DemoCell: FoldingCell {
    
  
    
    @IBOutlet weak var mapViewTwo: MKMapView!
    @IBOutlet weak var vendorLogo: UIImageView!
    @IBOutlet weak var vendorName: UILabel!
    @IBOutlet weak var foodType: UILabel!
    @IBOutlet weak var distance: UILabel!
    

    //this code is for map
    typealias coordinate = (latitude:Double, longitude: Double)
    
    let names: [String:coordinate] = ["newyork":(40.7128,-74.0059),"seattle":(47.6062,-122.3321),"sf":(37.7786,-122.3893),
                                      "texas":(31.9686,-99.9018)]
    
    
    //this code is for animations of the foldingcell
    
    override func awakeFromNib() {
        foregroundView.layer.cornerRadius = 10
        foregroundView.layer.masksToBounds = true
        super.awakeFromNib()
    }
    
    
    override func animationDuration(_ itemIndex: NSInteger, type: FoldingCell.AnimationType) -> TimeInterval {
        let durations = [0.26, 0.2, 0.2]
        return durations[2]
    }

}




// MARK: - Actions
extension DemoCell {
    @IBAction func buttonHandler(_ sender: AnyObject) {
        print("tap")
    }
    
}
