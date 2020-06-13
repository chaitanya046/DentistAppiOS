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
    
    //executes when save button is pressed
    @IBAction func btnSave(_ sender: UIButton)
    {
		//getting text values from the textfield and assigning them to the variables which we are using in the alert dialog box
        let name: String = nameEntered.text!
        let age: String = ageEntered.text!
        let phone: String = phoneEntered.text!
        //checks if all the inputs are filled or not
        if(name.isEmpty || age.isEmpty || phone.isEmpty){
            let alert = UIAlertController(title: "Information Not saved ", message: "Please fill all the input fields", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            //informaion is valid and filled correctly
             let alert = UIAlertController(title: "Information Saved", message: "Dear, "+name+" Aged: "+age+" you will be soon sent details on: "+phone, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    var myDateString = "Date"
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        //getting date from the datepicker and assigning it to the variable which we will use in the alert dialog box
          let dateFormatter = DateFormatter()

    dateFormatter.dateStyle = DateFormatter.Style.short
    dateFormatter.timeStyle = DateFormatter.Style.short

     myDateString = dateFormatter.string(from: datepicker.date)
       
    }
    //executes when confirm button is pressed
    @IBAction func btnConfirm(_ sender: Any) {
        //creates and displays the alert
        let alert = UIAlertController(title: "Apointment Confirmed", message: "Your appointment is confirmed "+myDateString, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
               self.present(alert, animated: true, completion: nil)
        
        
    }
    
    
}

		
