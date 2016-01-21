//
//  RestaurantDataDetailTableViewController.swift
//  example
//
//  Created by Trong Le on 1/20/16.
//  Copyright © 2016 Trong Le. All rights reserved.
//

import UIKit
import MapKit
import Parse

class RestaurantDataDetailTableViewController: UITableViewController, MKMapViewDelegate {

    var restaurant: PFObject?
    
    // Declare mapView
    @IBOutlet weak var restaurantMapView: MKMapView! {
        didSet {
            restaurantMapView.mapType = .Standard
            restaurantMapView.delegate = self
        }
        
    }
    
    // Set name label
    @IBOutlet weak var restaurantName: UILabel! {
        didSet {
            restaurantName.text = restaurant?["Name"] as? String
        }
    }
    
    // Add pin annotation for restaurant
    private func addLocationAnnotation() {
        let location = restaurant?["Address"] as! PFGeoPoint
        let lat = location.latitude
        let long = location.longitude
        let restaurantLoc = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let annotation = MyAnnotation(coordinate: restaurantLoc, city: .Cincinnati)
        restaurantMapView.addAnnotation(annotation)
        setMapCenter(restaurantLoc)
    }
    
    // Center map on restaurant location
    private func setMapCenter(locationCenter: CLLocationCoordinate2D) {
        let latDelta: CLLocationDegrees = 0.005
        let longDelta: CLLocationDegrees = 0.005
        let span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        let region: MKCoordinateRegion = MKCoordinateRegionMake(locationCenter, span)
        
        self.restaurantMapView.setRegion(region, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let restaurantCity = restaurant?["City"] as! String
        addLocationAnnotation()

    }


    // MARK: - Table view data source

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
