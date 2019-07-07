//
//  MapViewModel.swift
//  ElegantMediaHotelAssignment
//
//  Created by Akila J Wasala on 7/5/19.
//  Copyright © 2019 AkilaWasala. All rights reserved.
//

import UIKit
import MapKit

class MapViewModel {

}

class Artwork: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        
        super.init()
    }
    
    var region : MKCoordinateRegion {
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        return MKCoordinateRegion(center: coordinate, span: span)
    }
}
