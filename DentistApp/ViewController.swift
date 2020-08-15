//
//  ViewController.swift
//  DentistApp
//
//  Created by user174125 on 6/11/20.
//  Copyright © 2020 Chaitanya Uttarwar. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var nameEntered: UITextField!
    
    @IBOutlet weak var phoneEntered: UITextField!
    
    @IBOutlet weak var ageEntered: UITextField!
    
    @IBOutlet weak var datepicker: UIDatePicker!
    
    @IBOutlet weak var personTab: UITableView!
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
            dismissKey()
        }
        else{
            //informaion is valid and filled correctly
            let alert = UIAlertController(title: "Information Saved", message: "Dear, "+name+" Aged: "+age+" you will be soon sent details on: "+phone, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            add()
            dismissKey()
        }
    }
    var myDateString = "Date"
    let today = Date()
    let dateFormatter = DateFormatter()
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        //getting date from the datepicker and assigning it to the variable which we will use in the alert dialog box
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        myDateString = dateFormatter.string(from: datepicker.date)
        
    }
    //executes when confirm button is pressed
    @IBAction func btnConfirm(_ sender: Any) {
        
        //if datepicker is not changed this means today's date and time is selected
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        myDateString = dateFormatter.string(from: today)
        
        //creates and displays the alert
        let alert = UIAlertController(title: "Apointment Confirmed", message: "Your appointment is confirmed "+myDateString, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        dismissKey()
    }
    
    func dismissKey()
    {
        //this fnction enables the user to dismiss the keyboard by tapping on the screen anywhere
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self.view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false; view.addGestureRecognizer(tap)
    }
    func add(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Person2", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        
        newUser.setValue("Foey", forKey: "name")
        newUser.setValue("34", forKey: "age")
        newUser.setValue("7845123658", forKey: "phone")
        
        do {
            try context.save()
        } catch {
            print("Failed saving")
}
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Tap gesture for UIView to dismiss keyboard
         let tapGesture = UITapGestureRecognizer(target: self,
                           action: #selector(hideKeyboard))
          view.addGestureRecognizer(tapGesture)
    }
    
    //hides the keyboard if we tap anywhere on the view
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
