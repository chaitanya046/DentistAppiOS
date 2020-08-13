//
//  DoctorCollectionViewCell.swift
//  DentistApp
//
//  Created by user173218 on 2020-08-11.
//  Copyright © 2020 Chaitanya Uttarwar. All rights reserved.
//

import UIKit

class DoctorCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var specialityLabel: UILabel!
    
    var doctor: Doctor? {
        didSet {
            setup()
        }
    }
}

private extension DoctorCollectionViewCell {
    
    func setup() {
        guard let doc = doctor else { return }
        titleLabel.text = "Dr.\(doc.name)"
        specialityLabel.text = NSLocalizedString(doc.speciality, comment: "")
        updateLables()
    }
    
    func updateLables() {
        let fontBody = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        titleLabel.font = fontBody
        specialityLabel.font = fontBody
    }
}
