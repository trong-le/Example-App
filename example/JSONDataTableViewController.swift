//
//  JSONDataTableViewController.swift
//  example
//
//  Created by Trong Le on 1/2/16.
//  Copyright © 2016 Trong Le. All rights reserved.
//

import UIKit

// Cell identifier and JSOn data path
private let reuseIdentifier = "cell"
private let urlPath = "http://jsonplaceholder.typicode.com/posts"

class JSONDataTableViewController: UITableViewController, NSURLSessionDataDelegate {

    // Get URL request and declare session and array
    var request = NSURLRequest(URL: NSURL(string: urlPath)!)
    var session: NSURLSession!
    var arr = [[String : AnyObject]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up session to transfer data
        session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration(), delegate: self, delegateQueue: nil)
        let task = session.dataTaskWithRequest(request) { [weak self] (data, response, error) -> Void in
            
            // Make sure data isn't nil
            if let data = data {
                do {
                    
                    // Convert objects to correct types and load in table and array
                    let json =  try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as! [[String: AnyObject]]
                    self?.arr = json
                    self?.tableView.reloadData()
                } catch { }
            }
        }
        task.resume()
    }
    
    // MARK: - Table view data source

    // Only 1 column
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    // Number of rows there will be from given array and data
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    // Fill in sections and rows with data from url path
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath)
        let dat = arr[indexPath.row]
        let title = dat["title"] as? String
        cell.textLabel?.text = title
        let body = dat["body"] as? String
        cell.detailTextLabel?.text = body
        
        return cell
    }
}
