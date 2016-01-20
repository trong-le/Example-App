//
//  RestaurantDataTableViewController.swift
//  example
//
//  Created by Trong Le on 1/19/16.
//  Copyright © 2016 Trong Le. All rights reserved.
//

import UIKit
import Parse

private let reuseIdentifier = "cell"

class RestaurantDataTableViewController: UITableViewController {
    
    let query = PFQuery(className: "Restaurants")
    var restaurants: [PFObject]?
    
    func getData() {
        query.findObjectsInBackgroundWithBlock { [weak self] (restaurants, error) -> Void in
            if error == nil {
                self?.restaurants = restaurants
                self?.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return restaurants?.count ?? 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath)
        let restaurant = restaurants?[indexPath.row]
        let restaurantName = restaurant?["Name"] as! String
        
        cell.textLabel?.text = restaurantName
        
        return cell
    }

}
