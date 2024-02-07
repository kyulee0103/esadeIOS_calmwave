//
//  MyMapViewController.swift
//  calmWave
//
//  Created by 권규리 on 2023/11/21.
//

import UIKit
import MapKit

class MyMapViewController: UIViewController {

    @IBOutlet weak var myMap: MKMapView!
    
    var locator = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let center_map = CLLocationCoordinate2DMake(41.466498032040846, 2.0925143173228484)
                 
        let zoom_level = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                 
                 let region = MKCoordinateRegion(center: center_map, span: zoom_level)
                 
                 myMap.setRegion(region, animated: true)
        let corner_annotation = MKPointAnnotation()
        corner_annotation.coordinate = CLLocationCoordinate2DMake(41.466887848020455, 2.0914730861764323)
        corner_annotation.title = "CORNER4"
        corner_annotation.subtitle = "gym 4.7 ⭐️ (87+)  Excellent "
        myMap.addAnnotation(corner_annotation)
        
        let pilam_annotation = MKPointAnnotation()
        pilam_annotation.coordinate = CLLocationCoordinate2DMake(41.46908907129438, 2.0818846717583988)
        pilam_annotation.title = "Pilam Pilates"
        pilam_annotation.subtitle = "pilates 4.8 ⭐️ (23+)  Excellent "
        myMap.addAnnotation(pilam_annotation)
        
        let ashtanga_annotation = MKPointAnnotation()
        ashtanga_annotation.coordinate = CLLocationCoordinate2DMake(41.47104922479994, 2.08246769176597)
        ashtanga_annotation.title = "Ashtanga Yoga"
        ashtanga_annotation.subtitle = "yoga 5.0 ⭐️ (39+)  Perfect "
        myMap.addAnnotation(ashtanga_annotation)
        
        let clubPilates_annotation = MKPointAnnotation()
        clubPilates_annotation.coordinate = CLLocationCoordinate2DMake(41.47360236162112, 2.0912432847775255)
        clubPilates_annotation.title = "Club Pilates Sant Cugat"
        clubPilates_annotation.subtitle = "pilates 4.2 ⭐️ (21+)  Good "
        myMap.addAnnotation(clubPilates_annotation)
        
        locator.requestWhenInUseAuthorization()
                 
                 myMap.showsUserLocation = true

    }

}
