//
//  DoctorCell.swift
//  DentistApp
//
//  Created by user174340 on 7/17/20.
//  Copyright © 2020 Chaitanya Uttarwar. All rights reserved.
//

import UIKit

class DoctorCell: UITableViewCell {

  
    
    @IBOutlet weak var DoctorName: UILabel!
  
    @IBOutlet weak var DoctorNumber: UILabel!
    //setter to set the data related to particular doctor
    func setDoctor(doctor: Doctor) {
        DoctorName.text = doctor.doctorName
        DoctorNumber.numberOfLines = doctor.mobileNumber
    }
}
