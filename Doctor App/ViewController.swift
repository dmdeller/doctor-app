//
//  ViewController.swift
//  Doctor App
//
//  Created by David on 2/19/19.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var patients: [Patient]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchData()
    }
    
    // MARK: -
    
    func fetchData() {
        patients = Patient.allPatientsData.compactMap({ (patientData) -> Patient? in
            do {
                return try Patient(patientData: patientData)
                
            } catch let error {
                NSLog("Skipping patient because there was an error parsing patient data: \(patientData) error: \(error)")
                
                return nil
            }
        })
        
        reloadData()
    }

    func loadData () {
        
    }
    
    func reloadData(animated: Bool = true) {
        tableView.reloadData()
        loadData()
    }
    
    // MARK: -
    
//    func showAlert(title: String, message: String? = nil) {
//
//    }
//
//    func showError(error: Error) {
//
//    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let patients = patients else {
            return 0
        }
        
        return patients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let patients = patients else {
            fatalError("No patient data")
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PatientCell", for: indexPath) as? PatientCell else {
            fatalError("Wrong cell class")
        }
        
        let patient = patients[indexPath.row]
        
        cell.firstLabel.text = patient.first
        cell.lastLabel.text = patient.last
        cell.statusLabel.text = patient.status.rawValue
        
        
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}

