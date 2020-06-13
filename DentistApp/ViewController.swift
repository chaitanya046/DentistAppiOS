//
//  ViewController.swift
//  DentistApp
//
//  Created by user174125 on 6/11/20.
//  Copyright © 2020 Chaitanya Uttarwar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var nameEntered: UITextField!
    
    @IBOutlet weak var phoneEntered: UITextField!
    
    @IBOutlet weak var ageEntered: UITextField!
    
    @IBOutlet weak var saveLabel: UILabel!
    
    @IBOutlet weak var datepicker: UIDatePicker!
    
    @IBAction func btnSave(_ sender: UIButton)
    {
		//getting text values from the textfield and assigning them to the variables which we are using in the alert dialog box
        let name: String = nameEntered.text!
        let age: String = ageEntered.text!
        let phone: String = phoneEntered.text!
        let alert = UIAlertController(title: "Information Saved", message: "Dear, "+name+" Aged: "+age+" you will be soon sent details on: "+phone, preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func btnConfirm(_ sender: Any) {
		//getting date from the datepicker and assigning it to the variable which we will use in the alert dialog box
        let inputDate =  datepicker.date
        let formatter = DateFormatter()
        let myString = formatter.string(from: inputDate)
        
        
        let alert = UIAlertController(title: "Apointment Confirmed", message: "Your appointment is confirmed for: "+myString, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
               self.present(alert, animated: true, completion: nil)
        
        
    }
    
    
}

		
