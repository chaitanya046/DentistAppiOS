//
//  DoctorStore.swift
//  DentistApp
//
//  Created by user174108 on 7/17/20.
//  Copyright © 2020 Chaitanya Uttarwar. All rights reserved.
//


import UIKit

class DoctorStore {
    var allDoctors = [Doctor]()
    
    @discardableResult func createDoctor()->Doctor {
        let newDoctor = Doctor(random:true)
        allDoctors.append(newDoctor)
        return newDoctor
    }
    
    init() {
        for _ in 0..<5 {
            createDoctor()
        }
    }
    
    func removeDoctor(_ doctor: Doctor) {
        if let index = allDoctors.firstIndex(of: doctor) {
            allDoctors.remove(at: index)
        }
    }
    
    func moveDoctor(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        let movedItem = allDoctors[fromIndex]
        allDoctors.remove(at: fromIndex)
        allDoctors.insert(movedItem, at: toIndex)
    }
}
