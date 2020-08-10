//
//  DoctorCell.swift
//  DentistApp
//
//  Created by user174340 on 8/9/20.
//  Copyright © 2020 Chaitanya Uttarwar. All rights reserved.
//

import UIKit

class DoctorCell : UITableViewCell {
    @IBOutlet weak var titleLabel : UILabel!
    
    @IBOutlet weak var specialityLabel: UILabel!
    
    func updateLables() {
        let fontBody = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        titleLabel.font = fontBody
        specialityLabel.font = fontBody
        //let fontCaption = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.caption1)
        
        
    }
}
