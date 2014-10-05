//
//  MapViewViewController.swift
//  SJMeet
//
//  Created by Aaron Chuang on 10/4/14.
//  Copyright (c) 2014 Michelle Wu. All rights reserved.
//

/*import Foundation
import UIKit
import MapKit
import CoreLocation

class MapViewViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var theMapView: MKMapView!
    
    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.requestAlwaysAuthorization()
        // Do any additional setup after loading the view, typically from a nib.
        
        //coordinates for berkeley
        //37.87121,-122.250281
        
        
        var latitude:CLLocationDegrees = 37.87121
        var longitude:CLLocationDegrees = -122.250281
        
        var latDelta:CLLocationDegrees = 0.03
        var longDelta:CLLocationDegrees = 0.03
        
        var theSpan:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        var berkeleyLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        var theRegion:MKCoordinateRegion = MKCoordinateRegionMake(berkeleyLocation, theSpan)
        
        self.theMapView.setRegion(theRegion, animated: true)
        
        var berkeleyAnnotation = MKPointAnnotation();
        berkeleyAnnotation.coordinate = berkeleyLocation
        berkeleyAnnotation.title = "Cal-Hacks"
        berkeleyAnnotation.subtitle = "Hosted in Berkeley"
        
        self.theMapView.addAnnotation(berkeleyAnnotation)
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
/*
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        let currentLocation = manager.location*/
        /*
        let center = CLLocationCoordinate2D(latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.theMapView.setRegion(region, animated: true)
        
        /*let location = locations.last as CLLocation
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.theMapView.setRegion(region, animated: true)
        
        var selfAnnotation = MKPointAnnotation();
        //selfAnnotation.coordinate = location
        selfAnnotation.title = "You!"
        
        
        self.theMapView.addAnnotation(selfAnnotation)
        */
        
        
        
    }  */

}*/