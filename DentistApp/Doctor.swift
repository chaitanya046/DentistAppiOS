//
//  Doctor.swift
//  DentistApp
//
//  Created by user174340 on 8/6/20.
//  Copyright © 2020 Chaitanya Uttarwar. All rights reserved.
//

import UIKit

class Doctor : NSObject {
    var name: String
    var speciality: String
    
    init(name: String, speciality: String){
        self.name = name
        self.speciality = speciality
        
        super.init()
    }
    
    convenience init(random: Bool=false) {
        if random {
            let names = ["Monica", "Racheal", "Ross","Pheebe", "Joey"]
            let surnames = ["Bing","Tribbiani","Geller","Green"]
            let specialityName = ["Orthodontist", "Immunologist", "Cardiologists"]
            
            var idx = arc4random_uniform(UInt32(names.count))
            let randomName = names[Int(idx)]
            idx = arc4random_uniform(UInt32(surnames.count))
            let randomSurname = surnames[Int(idx)]
            let randomDoctorName = "\(randomName) \(randomSurname)"
            
            idx = arc4random_uniform(UInt32(specialityName.count))
            let randomSpeciality = specialityName[Int(idx)]
            let randomDoctorSpeciality = "\(randomSpeciality)"
    
            self.init(name: randomDoctorName, speciality: randomDoctorSpeciality)
        }else{
            self.init(name: "", speciality: "")
        }
        
    }
}
