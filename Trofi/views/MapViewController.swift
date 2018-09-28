//
//  MapViewController.swift
//  Trofi
//
//  Created by Dhrumil Shah on 2017-08-15.
//  Copyright © 2017 makeschool. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let height: CGFloat = 10 //whatever height you want
        let bounds = self.navigationController!.navigationBar.bounds
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + height)
        
    }
    
    @IBOutlet weak var mapView: MKMapView!
    
    typealias coordinate = (latitude:Double, longitude: Double)
    
    let names: [String:coordinate] = ["newyork":(40.7128,-74.0059),"seattle":(47.6062,-122.3321),"sf":(37.7786,-122.3893),
                                      "texas":(31.9686,-99.9018)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    

    @IBOutlet weak var minuteTensLabel: FlippingLabel!
    @IBOutlet weak var minuteUnitsLabel: FlippingLabel!
    
    var timer: Timer!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateClock(animated: false)
        startClockTimer()
    }
    
    func updateClock(animated:Bool) {
        
        let date = Date()
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm:ss:SS"
        let dateString: String = dateFormatter.string(from: date)
        let units: [String] = dateString.components(separatedBy: ":")
        
        dateFormatter.dateFormat = "hh:mm:ss"
        let fullDateString = dateFormatter.string(from: date)
        
        if animated == true {
            
                     //MINUTES
            minuteTensLabel.updateWithText(units[1].substring(to: units[0].index(units[0].startIndex, offsetBy: 1)))
            minuteUnitsLabel.updateWithText(units[1].substring(from: units[0].index(units[0].startIndex, offsetBy: 1)))
            
                } else {
            
                       //MINUTES
            minuteTensLabel.text = units[1].substring(to: units[0].index(units[0].startIndex, offsetBy: 1))
            minuteUnitsLabel.text = units[1].substring(from: units[0].index(units[0].startIndex, offsetBy: 1))
           
        }
    }
    
    /// Gives an Date object corresponding to the next exact second (000 ms)
    /// - Returns: a Date Object
    fileprivate func nextSecondDate() -> Date {
        let date = Date()
        let calendar = Calendar(identifier: .gregorian)
        let currentComponents = calendar.dateComponents([.hour, .minute, .second], from: date)
        return calendar.date(bySettingHour: currentComponents.hour!, minute: currentComponents.minute!, second: (currentComponents.second!+1) % 60, of: date)!
    }

}

extension MapViewController {
    
    fileprivate func startClockTimer() {
        
        // We will start the timer half a second after the next 'exact second'
        // to avoir precision problem for the next clock update (for example getting
        // the text one millisecond too early could show a wrong clock time
        
        let fireDate = nextSecondDate()
        var fireDateTimeInterval = fireDate.timeIntervalSince1970
        fireDateTimeInterval += 0.5
        
        timer = Timer.scheduledTimer(timeInterval: 1.00, target: self, selector: #selector(self.handleTimerTick), userInfo: nil, repeats: true)
    }
    
    @objc fileprivate func handleTimerTick() {
        self.updateClock(animated: true)
    }
}
