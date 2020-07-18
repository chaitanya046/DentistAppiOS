//
//  DoctorListScreen.swift
//  DentistApp
//
//  Created by user174340 on 7/16/20.
//  Copyright © 2020 Chaitanya Uttarwar. All rights reserved.
//

import UIKit
class DoctorListScreen : UITableViewController{
    var doctorStore: DoctorStore!
    var names = ["Micheal Stephenson", "Gabriel Thomson", "Ezequiel Olmson"]
    override func viewDidLoad() {
        super.viewDidLoad()
        //identifies the cell to be injected with the data
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        setting text in the cell
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
   
    
}
