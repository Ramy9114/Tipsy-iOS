//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var selectedPercentage = 10.0
    var billAmount = 0.0
    var percentage = 0.1
    var splitNumber = 2
    var totalBillPerPerson  = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //by default, the selected Percentage UI will be on 10%
        selectedPercentage = 10.0
        
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        let pressedButtonTitle = sender.currentTitle!
        tipUIChange(zeroPctButton, tenPctButton, twentyPctButton, pressedButtonTitle)
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        //get the bill from text field
        billAmount = Double(billTextField.text ?? "0") ?? 0.0
        //get the Percentage selected
        percentage = getPercentage(selectedPercentage)
        // get the split number
        splitNumber = Int(splitNumberLabel.text ?? "2") ?? 2
        
        totalBillPerPerson = (billAmount * (percentage + 1)) / Double(splitNumber)
        print(totalBillPerPerson)
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
    }
    
    func tipUIChange(_ button1 : UIButton, _ button2 : UIButton, _ button3 : UIButton, _ buttonTitle: String!) {
        switch buttonTitle {
        case "0%":
            //change first the properties of the button pressed
            button1.isSelected = true
            //change the properties of the two other buttons
            button2.isSelected = false
            button3.isSelected = false
            //change the selected percentage
            selectedPercentage = 0.0
            
        case "10%":
            //change first the properties of the button pressed
            button2.isSelected = true
            //change the properties of the two other buttons
            button1.isSelected = false
            button3.isSelected = false
            
            //change the selected percentage
            selectedPercentage = 10.0
            
        case "20%":
            //change first the properties of the button pressed
            button3.isSelected = true
            //change the properties of the two other buttons
            button1.isSelected = false
            button2.isSelected = false
            //change the selected percentage
            selectedPercentage = 20.0
        default:
            if buttonTitle == nil {print("non of the Buttons were selected")}
        }
    }
    
    func getPercentage(_ selectedPercentage: Double?) -> Double {
        return (selectedPercentage ?? 100.0)  / 100.0
    }
    
    
    //This method gets triggered just before the segue starts.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //If the currently triggered segue is the "goToResults" segue.
        if segue.identifier == "goToResults" {
            
            //Get hold of the instance of the destination VC and type cast it to a ResultViewController.
            let destinationVC = segue.destination as! ResultsViewController
            
            //Set the destination ResultsViewController's properties.
            destinationVC.totalBill = totalBillPerPerson
            destinationVC.percentage = percentage * 100
            destinationVC.splitNumber = splitNumber
        }
    }

}

