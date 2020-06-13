//
//  ViewController.swift
//  DentistApp
//
//  Created by user174125 on 6/11/20.
//  Copyright © 2020 Chaitanya Uttarwar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
  
    
    @IBOutlet weak var btnClick: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //let firstFrame = CGRect(x: 160, y: 240, width: 100, height: 150)
        //let firstView = UIView(frame: firstFrame)
        //firstView.backgroundColor = UIColor.blue
        //view.addSubview(firstView)
              btnClick.addTarget(self,action: #selector(tapOnButton), for: .touchUpInside)    }

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

		
