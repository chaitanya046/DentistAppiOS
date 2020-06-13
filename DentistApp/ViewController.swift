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
    @IBAction func btnSave(_ sender: UIButton)
    {
        let name: String = nameEntered.text!
        let age: String = ageEntered.text!
        let phone: String = phoneEntered.text!
        //saveLabel.text = "Thank you, "+nameEntered.text
        let alert = UIAlertController(title: "Information Saved", message: "Dear, "+name+" Aged: "+age+" you will be soon sent details on: "+phone, preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func tapOnButton(){
        let story = UIStoryboard(name: "Main", bundle: nil)
        let controller = story.instantiateViewController(identifier: "ViewController") as! ViewController
        self.present(controller,animated: true,completion: nil )
    }
    
    @objc func tapOnButtonForNavigation(){
        let story = UIStoryboard(name: "Main", bundle: nil)
        let controller = story.instantiateViewController(identifier: "ViewController") as! ViewController
        let navigation = UINavigationController(rootViewController: controller)
        self.view.addSubview(navigation.view)
        self.addChild(navigation)
        navigation.didMove(toParent: self)
    }
}

		
