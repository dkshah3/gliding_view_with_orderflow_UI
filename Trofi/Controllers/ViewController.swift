//
//  ViewController.swift
//  Trofi
//
//  Created by Dhrumil Shah on 2017-07-19.
//  Copyright © 2017 makeschool. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: -
    // MARK: Vars
    
    
    @IBOutlet weak var containerViewA: UIView!
    @IBOutlet weak var containerViewB: UIView!
    @IBOutlet weak var runkeeperSwitch: DGRunkeeperSwitch?
    
    // MARK: -
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        navigationController!.navigationBar.isTranslucent = true
        navigationController!.navigationBar.barTintColor = UIColor(red: 108.0/255.0, green: 182.0/255.0, blue: 254.0/255.0, alpha: 1.0)
        
        let runkeeperSwitch = DGRunkeeperSwitch(titles: ["Meal", "Food"])
        runkeeperSwitch.backgroundColor = UIColor(red: 108.0/255.0, green: 182.0/255.0, blue: 254.0/255.0, alpha: 1.0)
        runkeeperSwitch.selectedBackgroundColor = UIColor(red: 244.0/255.0, green: 244.0/255.0, blue: 244.0/255.0, alpha: 1.0)
        runkeeperSwitch.titleColor = UIColor(red: 244.0/255.0, green: 244.0/255.0, blue: 244.0/255.0, alpha: 1.0)
        runkeeperSwitch.selectedTitleColor = UIColor(red: 98.0/255.0, green: 101.0/255.0, blue: 116.0/255.0, alpha: 1.0)
        runkeeperSwitch.titleFont = UIFont(name: "HelveticaNeue-light", size: 13.0)
        runkeeperSwitch.frame = CGRect(x: 30.0, y: 40.0, width: 200.0, height: 30.0)
        runkeeperSwitch.addTarget(self, action: #selector(ViewController.switchValueDidChange(sender:)), for: .valueChanged)
        navigationItem.titleView = runkeeperSwitch
    }
    
    // MARK: -
    
    @IBAction func switchValueDidChange(sender: DGRunkeeperSwitch!) {
        print("valueChanged: \(sender.selectedIndex)")
        if sender.selectedIndex == 0 {
            UIView.animate(withDuration: 0.5, animations: {
                self.containerViewA.alpha = 1
                self.containerViewB.alpha = 0
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.containerViewA.alpha = 0
                self.containerViewB.alpha = 1
            })
        }
    }
}


