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
    let reuseIdentifier = "ImageCell"
    
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
    
    // Switch to button to maps??
    @IBOutlet weak var restaurantAddress: UILabel! {
        didSet {
            restaurantAddress.text = restaurant?["Address"] as? String
        }
    }
    
    // Add website URL
    @IBOutlet weak var restaurantWebsite: UILabel! {
        didSet {
            restaurantWebsite.text = restaurant?["URL"] as? String
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let restaurantCity = restaurant?["City"] as! String
        addLocationAnnotation()
    }
    
    // Add pin annotation for restaurant
    private func addLocationAnnotation() {
        let location = restaurant?["Coordinates"] as! PFGeoPoint
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
}

extension RestaurantDataDetailTableViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = 5
        return count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ImageCell
        cell.restaurantImageView.image = UIImage(named: "Close-up_of_Sirius")
        
        return cell
    }
}

class ImageCell: UICollectionViewCell {
    @IBOutlet weak var restaurantImageView: UIImageView!
}




