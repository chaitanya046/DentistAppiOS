//
//  HospitalViewController.swift
//  DentistApp
//
//  Created by user174340 on 8/13/20.
//  Copyright © 2020 Chaitanya Uttarwar. All rights reserved.
//

import UIKit

class HospitalViewController : UITableViewController {
    
    var hospitalStore : HospitalStore!
    
    
    
    @IBAction func getHospitals(_ sender: Any) {
        
        hospitalStore.getAllHospitals { (hospitalsResult)->Void in
            switch hospitalsResult {
            case let .success(hospitals):
                self.hospitals = hospitals
                self.tableView.reloadData()
            case let .failure(error):
                print("Error fetching hospitals \(error)")
            }
        }
        
    }
    
    var hospitals = [Hospital]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let hospitalStore = HospitalStore()
        self.hospitalStore = hospitalStore
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hospitals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let identifier = "HospitalTableViewController"
        let cell = tableView.dequeueReusableCell(withIdentifier: "HospitalTableViewCell", for: indexPath) as! HospitalTableViewCell
        let oneHospital = hospitals[indexPath.row]
        cell.hospitalName.text = oneHospital.name
        cell.hospitalLocation.text = oneHospital.location
        return cell
        
    }
    
}
