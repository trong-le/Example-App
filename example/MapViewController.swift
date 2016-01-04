//
//  MapViewController.swift
//  example
//
//  Created by Trong Le on 1/3/16.
//  Copyright © 2016 Trong Le. All rights reserved.
//

import UIKit
import MapKit

private let identifier = "Seattle"

class MapViewController: UIViewController, MKMapViewDelegate {

    // Set map view delegate and view type
    @IBOutlet weak var mapView: MKMapView! {
        didSet {
            //mapView.mapType = .Satellite
            mapView.delegate = self
        }
    }
    
    private var seattleDescription: String = ""
    private var hillsboroDescription: String = ""
    private var columbusDescription: String = ""
    private var cincinnatiDescription: String = ""
    
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
        seattleDescription = annotationSeattle.description
        mapView.addAnnotation(annotationSeattle)
        
        let annotationHillsboro = MKPointAnnotation()
        annotationHillsboro.coordinate = hillsboroLocation
        annotationHillsboro.title = "Hillsboro, Ohio"
        annotationHillsboro.subtitle = "Where I went to high school."
        hillsboroDescription = annotationHillsboro.description
        mapView.addAnnotation(annotationHillsboro)
        
        let annotationColumbus = MKPointAnnotation()
        annotationColumbus.coordinate = columbusLocation
        annotationColumbus.title = "Columbus, Ohio"
        annotationColumbus.subtitle = "Where I attended college. Go Bucks!"
        columbusDescription = annotationColumbus.description
        mapView.addAnnotation(annotationColumbus)
        
        let annotationCincinnati = MKPointAnnotation()
        annotationCincinnati.coordinate = cincinnatiLocation
        annotationCincinnati.title = "Cincinnati, Ohio"
        annotationCincinnati.subtitle = "Where I currently reside."
        cincinnatiDescription = annotationCincinnati.description
        mapView.addAnnotation(annotationCincinnati)
        
    }
    
    // Set up callout accessory view (Right info button)
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        let view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        view.canShowCallout = true
        let but = UIButton(type: .DetailDisclosure)
        view.rightCalloutAccessoryView = but
        
        return view
    }
    
    // What the info button does
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        if control == view.rightCalloutAccessoryView {
            if view.annotation?.description == seattleDescription {
                return performSegueWithIdentifier("Seattle", sender: self)
            }
            
            if view.annotation?.description == hillsboroDescription {
                return performSegueWithIdentifier("Hillsboro", sender: self)
            }
            
            if view.annotation?.description == columbusDescription {
                return performSegueWithIdentifier("Columbus", sender: self)
            }
            
            if view.annotation?.description == cincinnatiDescription {
                return performSegueWithIdentifier("Cincinnati", sender: self)
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let ivc = segue.destinationViewController as? ImageViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case "Seattle":
                    ivc.imageURL = Locations.Seattle
                    ivc.title = "Seattle, Washington"
                case "Hillsboro":
                    ivc.imageURL = Locations.Hillsboro
                    ivc.title = "Hillsboro, Ohio"
                case "Columbus":
                    ivc.imageURL = Locations.Columbus
                    ivc.title = "Columbus, Ohio"
                case "Cincinnati":
                    ivc.imageURL = Locations.Cincinnati
                    ivc.title = "Cincinnati, Ohio"
                default: break
                }
            }
        }
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
