//
//  TimerController2.swift
//  Trofi
import UIKit

class ClockUILabelTwo: UILabel {
    let dateFormatter = DateFormatter()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initializeClock()
    }
    
    func initializeClock(){
        let date = Date()
        let calendar = Calendar.current
        // Get current seconds to launch first clock update
        // The seconds left to the next minute [hh:mm:00]
        let seconds = 60 - calendar.component(.second, from: date)
        // Create a timer when the next minute start [hh:mm:00].
        // This timer only call once. Is the one that triggers the create60SecsTimer is called exactly when the minute starts
        Timer.scheduledTimer(timeInterval: TimeInterval(seconds), target: self, selector: #selector(create60SecsTimer), userInfo: nil, repeats:false);
        updateLabel()
    }
    
    func create60SecsTimer(){
        updateLabel()
        Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(updateLabel), userInfo: nil, repeats:true);
    }
    
    func updateLabel() -> Void {
        dateFormatter.dateFormat = "HH:mm"
        let fecha = dateFormatter.string(from: Date())
        self.text = fecha
    }
}
