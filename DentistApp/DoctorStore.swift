//
//  DoctorStore.swift
//  DentistApp
//
//  Created by user174340 on 8/6/20.
//  Copyright © 2020 Chaitanya Uttarwar. All rights reserved.
//

import UIKit

class DoctorStore {
    var allDoctors = [Doctor]()
    
    @discardableResult func createDoctor()->Doctor {
        let newDoctor = Doctor(random : true)
        allDoctors.append(newDoctor)
        return newDoctor
    }
    
    init() {
        for _ in 0..<5 {
            createDoctor()
            //print(allDoctors)
        }
    }
    
    func removeDoctor(_ doctor: Doctor) {
        if let index = allDoctors.firstIndex(of: doctor) {
            allDoctors.remove(at: index)
        }
        
    }
    
}
