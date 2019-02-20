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
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var warningLabelHeightConstraint: NSLayoutConstraint!
    
    var patients: [Patient]?
    var numSkippedPatients = 0
    
    var patientImages: [Patient: UIImage] = [:]
    var patientImageTasks: [Patient: URLSessionDataTask] = [:]
    let urlSession = URLSession(configuration: URLSessionConfiguration.default)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Retrieve fresh data from remote resource every time view appears
        fetchData()
    }
    
    // MARK: -
    
    // Retrieve data from remote resource (slow) and cache locally, if desired
    func fetchData() {
        numSkippedPatients = 0
        patients = Patient.allPatientsData.compactMap({ (patientData) -> Patient? in
            do {
                return try Patient(patientData: patientData)
                
            } catch let error {
                NSLog("Skipping patient because there was an error parsing patient data: \(patientData) error: \(error)")
                
                numSkippedPatients += 1
                
                return nil
            }
        })
        
        reloadData()
    }

    // Retrieve data from local resource (fast) and/or perform any final transformations prior to display
    func loadData () {
        // Sort patients by last name, then first name
        patients = patients?.sorted(by: { (patient1, patient2) -> Bool in
            let lastNameComparison = patient1.last.compare(patient2.last)
            if lastNameComparison == .orderedSame {
                return (patient1.first.compare(patient2.first) == .orderedAscending)
                
            } else {
                return (lastNameComparison == .orderedAscending)
            }
        })
        
        if numSkippedPatients > 0 {
            warningLabelHidden = false
            warningLabel.text = "\(numSkippedPatients) records are currently unavailable.\nContact your system administrator for assistance."
            
        } else {
            warningLabelHidden = true
        }
    }
    
    func reloadData(animated: Bool = true) {
        tableView.reloadData()
        loadData()
    }
    
    // MARK: -
    
    var warningLabelHidden: Bool {
        get {
            return warningLabelHeightConstraint.isActive
        }
        set {
            warningLabelHeightConstraint.isActive = newValue
        }
    }
    
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
        cell.statusLabel.text = patient.status.displayName
        
        if let image = patientImages[patient] {
            cell.patientImageView.image = image
            
        } else if let url = patient.image, patientImageTasks[patient] == nil {
            // By default, this happens on a background thread
            let task = urlSession.dataTask(with: url, completionHandler: { (data, response, error) in
                self.patientImageTasks[patient] = nil
                
                guard error == nil else {
                    NSLog("Error retrieving image at URL: \(url), error: \(error!)")
                    return
                }
                
                if let data = data {
                    self.patientImages[patient] = UIImage(data: data)
                    
                    // Switch back to main thread for UI work
                    OperationQueue.main.addOperation {
                        self.debounceTableViewReload()
                    }
                }
            })
            task.resume()
            patientImageTasks[patient] = task
        }
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    // MARK: -
    
    // There are a lot of images being download, and reloading the table view every single time one of them downloads kills performance (even if you try to only reload that one row).
    // This method prevents reloads from happening too rapidly.
    // This is not an optimal solution because it delays display of images by up to 0.5 seconds. An optimal solution might require a lot more lines of code, in which case we should probably use a third-party library that has solved this problem already, like SDWebImage or Alamofire.
    var nextReloadTimer: Timer?
    func debounceTableViewReload() {
        guard nextReloadTimer == nil else {
            return
        }
        
        nextReloadTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            self.nextReloadTimer = nil
            self.tableView.reloadData()
        })
    }
    
}

