//
//  MapViewController.swift
//  example
//
//  Created by Trong Le on 1/3/16.
//  Copyright © 2016 Trong Le. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

private let identifier = "pin"

class MapViewController: UIViewController, MKMapViewDelegate {
    
    // Set map view delegate and view type
    @IBOutlet weak var mapView: MKMapView! {
        didSet {
            mapView.mapType = .Satellite
            mapView.delegate = self
        }
    }
    
    // initialize identifiers for each city
    private var seattleDescription: String?
    private var hillsboroDescription: String?
    private var columbusDescription: String?
    private var cincinnatiDescription: String?
    
    // City locations
    let seattleLocation = CLLocationCoordinate2D(latitude: 47.6097, longitude: -122.3331)
    let hillsboroLocation = CLLocationCoordinate2D(latitude: 39.2058, longitude: -83.6139)
    let columbusLocation = CLLocationCoordinate2D(latitude: 39.9833, longitude: -82.9833)
    let cincinnatiLocation = CLLocationCoordinate2D(latitude: 39.1000, longitude: -84.5167)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add annotations and details
        let annotationSeattle = MyAnnotation(coordinate: seattleLocation, city: .Seattle)
        annotationSeattle.title = "Seattle, Washington"
        annotationSeattle.subtitle = "Where I was born."
        mapView.addAnnotation(annotationSeattle)
        
        let annotationHillsboro = MyAnnotation(coordinate: hillsboroLocation, city: .Hillsboro)
        annotationHillsboro.title = "Hillsboro, Ohio"
        annotationHillsboro.subtitle = "Where I went to high school."
        mapView.addAnnotation(annotationHillsboro)
        
        let annotationColumbus = MyAnnotation(coordinate: columbusLocation, city: .Columbus)
        annotationColumbus.title = "Columbus, Ohio"
        annotationColumbus.subtitle = "Where I attended college. Go Bucks!"
        mapView.addAnnotation(annotationColumbus)
        
        let annotationCincinnati = MyAnnotation(coordinate: cincinnatiLocation, city: .Cincinnati)
        annotationCincinnati.title = "Cincinnati, Ohio"
        annotationCincinnati.subtitle = "Where I currently reside."
        mapView.addAnnotation(annotationCincinnati)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyPressed:", name: "Ayy", object: nil)
        
    }
    
    func keyPressed() {
        NSNotificationCenter.defaultCenter().postNotificationName("Pressed", object: nil)
        print("Checl")
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
        performSegueWithIdentifier("PictureSegue", sender: view.annotation)
    }
    
    // Set up segues
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let ivc = segue.destinationViewController as? ImageViewController {
            if let myAnnotation = sender as? MyAnnotation {
                switch myAnnotation.city {
                case .Seattle:
                    ivc.imageURL = Locations.Seattle
                    ivc.title = "Seattle, Washington"
                case .Hillsboro:
                    ivc.imageURL = Locations.Hillsboro
                    ivc.title = "Hillsboro, Ohio"
                case .Columbus:
                    ivc.imageURL = Locations.Columbus
                    ivc.title = "Columbus, Ohio"
                case .Cincinnati:
                    ivc.imageURL = Locations.Cincinnati
                    ivc.title = "Cincinnati, Ohio"
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

// Create class with annotation protocols plus cities
class MyAnnotation: NSObject, MKAnnotation {
    
    enum MyCities {
        case Seattle
        case Hillsboro
        case Columbus
        case Cincinnati
    }
    
    private var _coordinate: CLLocationCoordinate2D
    // Create since coordinate is read-only
    var coordinate: CLLocationCoordinate2D {
        get {
            return _coordinate
        }
    }
    
    // Follow MKAnnotation protocols
    var title: String?
    var subtitle: String?
    var city: MyCities
    
    // Initialize
    init(coordinate: CLLocationCoordinate2D, city: MyCities) {
        self._coordinate = coordinate
        self.city = city
        super.init()
    }
}
