//
//  MapViewController.swift
//  DentistApp
//
//  Created by user174125 on 7/18/20.
//  Copyright © 2020 Chaitanya Uttarwar. All rights reserved.
//

import MapKit
import UIKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {
    
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
        mapRegion.center.latitude = 43.390712
        mapRegion.center.longitude = -80.405973
        mapRegion.span.latitudeDelta = 0.2
        mapRegion.span.longitudeDelta = 0.2
        mapView.setRegion(mapRegion, animated: true)
        let parliamentLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(43.390712, -80.405973)
        let parliamentAnnotation = AnnotationsClass(coordinate: parliamentLocation, name: "Grand river hospital")
        mapView.addAnnotation(parliamentAnnotation)
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation)-> MKAnnotationView? {
        let newAnnotation: MKAnnotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "My annotation")
        newAnnotation.canShowCallout = true
        newAnnotation.setSelected(true, animated: true)
        return newAnnotation
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
