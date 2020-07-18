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
//    var numbers = [4123451345, 43364564563, 89758934759]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
 
//    func createArray()->[Doctor]{
//        var tempDoctors : [Doctor]=[]
//        let doctor1 = Doctor(doctorName:"Joey", mobileNumber: 1231231231)
//        let doctor2 = Doctor(doctorName: "Monica", mobileNumber: 1212121212)
//        tempDoctors.append(doctor1)
//        tempDoctors.append(doctor2)
//        return tempDoctors
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        let doctor = doctorStore.allDoctors
        cell.textLabel?.text = names[indexPath.row]
//        cell.detailTextLabel?.text = "$\(numbers[indexPath.row])"
        return cell
    }
   
    
}
