//
//  MainTableViewController.swift
//  Trofi
//
//  Created by Dhrumil Shah on 2017-07-22.
//  Copyright © 2017 makeschool. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import FoldingCell

class MainTableViewController: UITableViewController {
    
    var allVendors: [Vendors] = []

    
    let kCloseCellHeight: CGFloat = 160
    let kOpenCellHeight: CGFloat = 488
    var cellHeights: [CGFloat] = []
    
    var types = ""
    var priceRanges = ""
    var distances = ""
    var vendorNames = ""
    var servingsNumberVar = ""
    var priceLabelVar = ""
    var nameVar = ""
    var vendorKeys = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        let apiToContact = "https://trofi-af6c0.firebaseio.com/Vendors.json?key=AIzaSyDj6_mHptVU4R5CJVEEbA9Qe3UMVGMY8dY"
        
        let request = Alamofire.request(apiToContact, method: .get, parameters: nil, encoding: URLEncoding.queryString, headers: nil)
        
        request.validate().responseJSON() { response in
            
            switch response.result{
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    
                    print(json)
                    let vendorDict = json.dictionaryValue
                    let componetArray = [String](vendorDict.keys)
                    
                    print("Look here")
                    for vendorDictKey in componetArray {
                        self.vendorKeys.append(vendorDictKey)
                        self.allVendors.append(Vendors(json: vendorDict[vendorDictKey]!))
                    }
                    
                    
                    
                    print("type should be printed here")
                    for type in self.allVendors {
                        self.types.append(type.type)
                    }
                    
                    print("price range should be printed here")
                    for priceRange in self.allVendors {
                        self.priceRanges.append(priceRange.priceRange)
                        
                    }
                    
                    print("distance should be printed here")
                    for distance in self.allVendors {
                        self.distances.append(distance.distance)
                    }
                    
                    print("vendor name should be printed here")
                    for vendorName in self.allVendors {
                        self.vendorNames.append(vendorName.vendorName)
                        
                    }
                    print("number of servings available")
                    for servingsNumber in self.allVendors{
                        self.servingsNumberVar.append(servingsNumber.servingsNumber)
                    }
                    
                    print("the price is")
                    for priceLabel in self.allVendors{
                        self.priceLabelVar.append(priceLabel.priceLabel)
                    }
                    print("the name of the food is")
                    for name in self.allVendors{
                        self.nameVar.append(name.name)
                    }

                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
                           case .failure(let error):
                print(error)
            }
            print(self.allVendors)
            
        }}
    
    
        
    private func setup() {
        cellHeights = Array(repeating: kCloseCellHeight, count: 20)
        tableView.estimatedRowHeight = kCloseCellHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }
}


// MARK: - TableView
extension MainTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.allVendors.count)
       return self.allVendors.count
    }
    
//    override func numberOfSections(in tableView: UITableView) -> Int
//    {
//        return self.allVendors.count
//    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard case let cell as DemoCell = cell else {
            return
        }

        
        let vendor = self.allVendors[indexPath.row]

        print(vendor)
        
        cell.foodType.text = vendor.type
        cell.vendorName.text = vendor.vendorName
        cell.backgroundColor = .clear
        
        print(cellHeights)
        if cellHeights[indexPath.row] == kCloseCellHeight {
            cell.selectedAnimation(false, animated: false, completion:nil)
        } else {
            cell.selectedAnimation(true, animated: false, completion: nil)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoldingCell", for: indexPath) as! FoldingCell
        let durations: [TimeInterval] = [0.26, 0.2, 0.2]
        cell.durationsForExpandedState = durations
        cell.durationsForCollapsedState = durations
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[indexPath.row]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! FoldingCell
        
        if cell.isAnimating() {
            return
        }
        
        var duration = 0.0
        let cellIsCollapsed = cellHeights[indexPath.row] == kCloseCellHeight
        if cellIsCollapsed {
            cellHeights[indexPath.row] = kOpenCellHeight
            cell.selectedAnimation(true, animated: true, completion: nil)
            duration = 0.5
        } else {
            cellHeights[indexPath.row] = kCloseCellHeight
            cell.selectedAnimation(false, animated: true, completion: nil)
            duration = 0.8
        }
        
        UIView.animate(withDuration: duration, delay: 0.2, options: .curveEaseOut, animations: { () -> Void in
            tableView.beginUpdates()
            tableView.endUpdates()
        }, completion: nil)
        
    }
    
}
