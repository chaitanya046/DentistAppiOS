//
//  Doctor.swift
//  DentistApp
//
//  Created by user174108 on 7/17/20.
//  Copyright © 2020 Chaitanya Uttarwar. All rights reserved.
//

import UIKit
class Doctor:NSObject{
        var doctorName: String
        var mobileNumber: Int
        init(doctorName: String, mobileNumber: Int) {
            self.doctorName = doctorName
            self.mobileNumber = mobileNumber
            super.init()
        }
   convenience init(random: Bool = false) {
         if random  {
             let names = ["Micheal Stephenson", "Gabriel Thomson", "Ezequiel Olmson"]
             let numbers = [4123451345, 43364564563, 89758934759]
             
             var idx = arc4random_uniform(UInt32(names.count))
             let randomName = names[Int(idx)]
             idx = arc4random_uniform(UInt32(numbers.count))
             let randomNumber = numbers[Int(idx)]
             
               self.init(doctorName: randomName, mobileNumber: randomNumber)
             
         } else {
             self.init(doctorName: "", mobileNumber: 0)
         }
     }}
