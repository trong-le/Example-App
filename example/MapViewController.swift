//
//  MapViewController.swift
//  example
//
//  Created by Trong Le on 1/3/16.
//  Copyright © 2016 Trong Le. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    // Set map view delegate and view type
    @IBOutlet weak var mapView: MKMapView! {
        didSet {
            mapView.mapType = .Satellite
            mapView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // City locations
        let seattleLocation = CLLocationCoordinate2D(latitude: 47.6097, longitude: -122.3331)
        let hillsboroLocation = CLLocationCoordinate2D(latitude: 39.2058, longitude: -83.6139)
        let columbusLocation = CLLocationCoordinate2D(latitude: 39.9833, longitude: -82.9833)
        let cincinnatiLocation = CLLocationCoordinate2D(latitude: 39.1000, longitude: -84.5167)
        
        // Add annotations
        let annotationSeattle = MKPointAnnotation()
        annotationSeattle.coordinate = seattleLocation
        annotationSeattle.title = "Seattle, Washington"
        annotationSeattle.subtitle = "Where I was born."
        mapView.addAnnotation(annotationSeattle)
        
        let annotationHillsboro = MKPointAnnotation()
        annotationHillsboro.coordinate = hillsboroLocation
        annotationHillsboro.title = "Hillsboro, Ohio"
        annotationHillsboro.subtitle = "Where I went to high school."
        mapView.addAnnotation(annotationHillsboro)
        
        let annotationColumbus = MKPointAnnotation()
        annotationColumbus.coordinate = columbusLocation
        annotationColumbus.title = "Columbus, Ohio"
        annotationColumbus.subtitle = "Where I attended college. Go Bucks!"
        mapView.addAnnotation(annotationColumbus)
        
        let annotationCincinnati = MKPointAnnotation()
        annotationCincinnati.coordinate = cincinnatiLocation
        annotationCincinnati.title = "Cincinnati, Ohio"
        annotationCincinnati.subtitle = "Where I currently reside."
        mapView.addAnnotation(annotationCincinnati)
        
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
