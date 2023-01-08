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
    
    var numberOfPeople : Double = 2.0
    var tipAmount : Double = 0.0
    var totalPerPerson : Double = 0.0
    var bill : Double = 0.0

    @IBAction func tipChanged(_ sender: UIButton)
    {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        billTextField.endEditing(true)
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper)
    {
        splitNumberLabel.text = String(Int(sender.value))
        numberOfPeople = sender.value
        print(numberOfPeople)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton)
    {
        if zeroPctButton.isSelected
        {
            tipAmount = 0.0
        }
        else if tenPctButton.isSelected
        {
            tipAmount = 0.1
        }
        else
        {
            tipAmount = 0.2
        }
        
        bill = Double(billTextField.text!) ?? 0.0
        print(type(of: bill))
        
        totalPerPerson = (bill + (bill * tipAmount)) / numberOfPeople
        print(totalPerPerson)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "goToResult"
            {
                let destination = segue.destination as! ResultsViewController
                destination.totalPerPerson = String(format: "%.1f", totalPerPerson)
                destination.tipAmount = String(tipAmount)
                destination.peopleAmount = String(format: "%.0f", numberOfPeople)
            }
        }
    }

