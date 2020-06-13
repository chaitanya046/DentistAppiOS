//
//  ViewController.swift
//  DentistApp
//
//  Created by user174125 on 6/11/20.
//  Copyright © 2020 Chaitanya Uttarwar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var saveLabel: UILabel!
    @IBAction func btnSave(_ sender: UIButton)
    {
        saveLabel.text = "Information saved!!"
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

		
