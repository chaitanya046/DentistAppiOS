//
//  DoctorDetailsViewController.swift
//  DentistApp
//
//  Created by user174340 on 8/9/20.
//  Copyright © 2020 Chaitanya Uttarwar. All rights reserved.
//

import UIKit

class DoctorDetailsViewController : UIViewController {
    
    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var specialityField: UITextField!
    
    var doctor: Doctor!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        titleField.text = doctor.name
        specialityField.text = doctor.speciality
    }
    
    @IBAction func backToDoctorsList(_ sender: Any) {
        doctor.name = titleField.text!
        doctor.speciality = specialityField.text!
        self.performSegue(withIdentifier: "unwindToDoctorListSegue", sender: self)
    }
}
