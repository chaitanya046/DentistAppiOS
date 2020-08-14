//
//  HospitalDetailsController.swift
//  DentistApp
//
//  Created by user174340 on 8/14/20.
//  Copyright © 2020 Chaitanya Uttarwar. All rights reserved.
//

import UIKit

class HospitalDetailsController : UIViewController {
    
    @IBOutlet weak var hospitalName: UILabel!
    @IBOutlet weak var hospitalLocation: UILabel!
    @IBOutlet weak var hospitalDescription: UILabel!
    
    var hospital : Hospital!
    
    override func viewWillAppear(_ animated: Bool) {
        hospitalName.text = hospital.name
        hospitalLocation.text = hospital.location
        hospitalDescription.text = hospital.description
    }
    
    
    
}
