//
//  HospitalTableViewCell.swift
//  DentistApp
//
//  Created by user174340 on 8/13/20.
//  Copyright © 2020 Chaitanya Uttarwar. All rights reserved.
//

import UIKit
class HospitalTableViewCell : UITableViewCell {
    
    @IBOutlet weak var hospitalName: UILabel!
    
    
    @IBOutlet weak var hospitalLocation: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        hospitalName.adjustsFontForContentSizeCategory = true
        hospitalLocation.adjustsFontForContentSizeCategory = true
    }
}

