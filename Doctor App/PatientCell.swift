//
//  PatientCell.swift
//  Doctor App
//
//  Created by David on 2/19/19.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

class PatientCell: UITableViewCell {

    @IBOutlet weak var lastLabel: UILabel!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var patientImageView: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        patientImageView.image = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
