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
        
        // Add annotations
        let annotation = MKPointAnnotation()
        annotation.coordinate = seattleLocation
        annotation.title = "Seattle, Washington"
        annotation.subtitle = "My hometown"
        mapView.addAnnotation(annotation)

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
