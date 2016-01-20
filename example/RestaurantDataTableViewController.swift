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
    
    // Get query from Parse and declare array
    let query = PFQuery(className: "Restaurants")
    var restaurants: [PFObject]?

    
    // Add data tp array
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
    
    // columns
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    // Rows
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants?.count ?? 0
    }
    

    // Extract data from array and display onto table
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath)
        let restaurant = restaurants?[indexPath.row]
        let restaurantName = restaurant?["Name"] as? String
        cell.textLabel?.text = restaurantName
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("restaurantInformation", sender: indexPath.row)
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {


        if let rtvc = segue.destinationViewController as? RestaurantDataDetailTableViewController {
            let row = sender as! Int
            let restaurant = restaurants?[row]
            rtvc.restaurant = restaurant
        }
    }
}
