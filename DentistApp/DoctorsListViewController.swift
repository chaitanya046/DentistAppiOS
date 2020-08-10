//
//  DoctorsListViewController.swift
//  DentistApp
//
//  Created by user174340 on 8/6/20.
//  Copyright © 2020 Chaitanya Uttarwar. All rights reserved.
//

import UIKit

class DoctorsListViewController : UITableViewController{
    var doctorStore: DoctorStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65
        let doctorStore = DoctorStore()
        self.doctorStore = doctorStore
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doctorStore.allDoctors.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DoctorCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorCell", for: indexPath) as! DoctorCell
        cell.updateLables()
        let doctor = doctorStore.allDoctors[indexPath.row]
        cell.titleLabel.text = "Dr.\(doctor.name)"
        cell.specialityLabel.text = doctor.speciality
        //cell.detailTextLabel?.text = "\(doctor.name)"
        
        return cell
    }
    
    @IBAction func AddNewDoctor(_ sender: UIButton) {
        let newDoctor = doctorStore.createDoctor()
        if let index = doctorStore.allDoctors.firstIndex(of: newDoctor) {
            let indexPath = IndexPath(row: index, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
        
    }
    
    @IBAction func EditBuuton(_ sender: UIButton) {
        if isEditing {
            sender.setTitle("Edit", for: .normal)
            setEditing(false, animated: true)
        }else{
            sender.setTitle("Done", for: .normal)
            setEditing(true, animated: true)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let doctor = doctorStore.allDoctors[indexPath.row]
            let title = "Delete \(doctor.name)?"
            let message = "Are you sure want to delete this Doctor record?"
            let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler:
            {(action)->Void in
                self.doctorStore.removeDoctor(doctor)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            })
            ac.addAction(deleteAction)
            present(ac,animated: true,completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showDoctor"?:
            if let row = tableView.indexPathForSelectedRow?.row {
                let doctor = doctorStore.allDoctors[row]
                let doctorDetailController = segue.destination as! DoctorDetailsViewController
                doctorDetailController.doctor = doctor
            }
        default:
            preconditionFailure("Unexpected identifier")
        }
    }
    
    @IBAction func unwindToDoctorList(segue: UIStoryboardSegue) {
        let source = segue.source as! DoctorDetailsViewController
        let doctor = source.doctor!
        if let row = tableView.indexPathForSelectedRow?.row {
            let tableDoctor = doctorStore.allDoctors[row]
            tableDoctor.name = doctor.name
            tableDoctor.speciality = doctor.speciality
        }
        tableView.reloadData()
        
    }
    
}
