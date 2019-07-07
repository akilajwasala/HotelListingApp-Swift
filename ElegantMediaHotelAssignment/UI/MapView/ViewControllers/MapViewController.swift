//
//  MapViewController.swift
//  ElegantMediaHotelAssignment
//
//  Created by Akila J Wasala on 7/5/19.
//  Copyright © 2019 AkilaWasala. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: BaseViewController {

    var selectedHotel: Hotel?
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setMapViewAndMarker()
    }

    fileprivate func setMapViewAndMarker() {
        guard let slat = selectedHotel?.latitude else { return }
        guard let slon = selectedHotel?.longitude else { return }
        
        let lat = Double(slat)
        let lon = Double(slon)
        
        //Set the marker and focus on it
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        let artwork = Artwork(title: (selectedHotel?.title)!, subtitle: (selectedHotel?.address)!, coordinate: CLLocationCoordinate2D(latitude: lat!, longitude: lon!))
        mapView.addAnnotation(artwork)
        self.mapView.addAnnotation(artwork)
        self.mapView.setRegion(artwork.region, animated: true)
    }
}

extension MapViewController : MKMapViewDelegate {
    
    //Highlight and show description when click on a marker
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as? MKMarkerAnnotationView {
            annotation.animatesWhenAdded = true
            annotation.titleVisibility = .adaptive
            annotation.subtitleVisibility = .adaptive
            return annotation
        }
        
        return nil
    }
}
