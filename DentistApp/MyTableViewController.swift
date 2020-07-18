//
//  MyTableViewController.swift
//  DentistApp
//
//  Created by user174108 on 7/18/20.
//  Copyright © 2020 Chaitanya Uttarwar. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

  

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            //let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
            let cell = UITableViewCell()
    //        let doctor = doctorStore.allDoctors
            cell.textLabel?.text = "names[indexPath.row]"
//            cell.detailTextLabel?.text = "$\(numbers[indexPath.row])"
            return cell
        }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

   

}
