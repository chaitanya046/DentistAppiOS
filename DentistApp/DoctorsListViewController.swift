//
//  DoctorsListViewController.swift
//  DentistApp
//
//  Created by user174340 on 8/6/20.
//  Copyright © 2020 Chaitanya Uttarwar. All rights reserved.
//

import UIKit

class DoctorsListViewController : UIViewController {
    
    var doctorStore: DoctorStore!
    
    @IBOutlet weak private var tableView: UITableView!
    @IBOutlet weak private var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        //        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        //        tableView.contentInset = insets
        //        tableView.scrollIndicatorInsets = insets
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65
        let doctorStore = DoctorStore()
        self.doctorStore = doctorStore
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        tableView.isHidden = false
        collectionView.isHidden = true
    }
    
    @IBAction func AddNewDoctor(_ sender: UIButton) {
        let newDoctor = doctorStore.createDoctor()
        if let index = doctorStore.allDoctors.firstIndex(of: newDoctor) {
            let indexPath = IndexPath(row: index, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    @IBAction func EditBuuton(_ sender: UIButton) {
        if tableView.isEditing {
            sender.setTitle(NSLocalizedString("Edit", comment: ""), for: .normal)
            tableView.setEditing(false, animated: true)
        }else{
            sender.setTitle(NSLocalizedString("Done", comment: ""), for: .normal)
            tableView.setEditing(true, animated: true)
        }
    }
    
    @IBAction func layoutButtonAction(_ sender: UIButton) {
        if sender.titleLabel?.text == "Collection Layout" {
            sender.setTitle("Table Layout", for: .normal)
            tableView.isHidden = true
            collectionView.isHidden = false
        }else{
            sender.setTitle("Collection Layout", for: .normal)
            tableView.isHidden = false
            collectionView.isHidden = true
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

extension DoctorsListViewController: UITableViewDataSource, UITableViewDelegate {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doctorStore.allDoctors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DoctorCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorCell", for: indexPath) as! DoctorCell
        cell.updateLables()
        let doctor = doctorStore.allDoctors[indexPath.row]
        cell.titleLabel.text = "Dr.\(doctor.name)"
        cell.specialityLabel.text = NSLocalizedString(doctor.speciality, comment: "")
        //cell.detailTextLabel?.text = "\(doctor.name)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
                self.collectionView.reloadData()
            })
            ac.addAction(deleteAction)
            present(ac,animated: true,completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView,
                   contextMenuConfigurationForRowAt indexPath: IndexPath,
                   point: CGPoint) -> UIContextMenuConfiguration? {
        
        let copy = UIAction(title: "Copy") {_ in
            let doctor = self.doctorStore.allDoctors[indexPath.row]
            let pasteboard = UIPasteboard.general
            pasteboard.string = doctor.name
        }
        let share = UIAction(title: "Share") {_ in
            let doctor = self.doctorStore.allDoctors[indexPath.row]
            let data = ["Doctor Information", doctor.name] as [Any]
            UIApplication.share(data)
        }
        let delete = UIAction(title: "Delete") {_ in
            let doctor = self.doctorStore.allDoctors[indexPath.row]
            self.doctorStore.removeDoctor(doctor)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            self.collectionView.reloadData()
        }
        
        return UIContextMenuConfiguration(identifier: nil,
                                          previewProvider: nil) { _ in
                                            UIMenu(title: "Actions", children: [copy, share, delete])
        }
    }
}

extension DoctorsListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return doctorStore.allDoctors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DoctorCell", for: indexPath as IndexPath) as! DoctorCollectionViewCell
        cell.doctor = doctorStore.allDoctors[indexPath.row]
        cell.backgroundColor = UIColor.cyan
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 84)
    }
}
