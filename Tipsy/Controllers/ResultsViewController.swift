//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Rami Moubayed on 19/11/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalBill = 0.0
    var percentage = 10.0
    var splitNumber = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = String(format: "%.2f", totalBill) + " €"
        settingsLabel.text = "Split between \(splitNumber) people, with \(Int(percentage))% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
