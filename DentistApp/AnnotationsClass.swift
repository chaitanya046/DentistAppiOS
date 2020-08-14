//
//  AnnotationsClass.swift
//  DentistApp
//
//  Created by user174340 on 8/14/20.
//  Copyright © 2020 Chaitanya Uttarwar. All rights reserved.
//

import Foundation
import MapKit

class AnnotationsClass : NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var name: String?
    
    init(coordinate: CLLocationCoordinate2D, name:String) {
        self.coordinate = coordinate
        self.name = name
    }
    
}
