//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Ikbal Demirdoven on 2023-01-08.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    var totalPerPerson : String?
    var peopleAmount : String?
    var tipAmount : String?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        totalLabel.text = totalPerPerson
        switch tipAmount
        {
        case "0.0":
            tipAmount = "0"
        case "0.1":
            tipAmount = "10"
        case "0.2":
            tipAmount = "20"
        default:
            tipAmount = "No tip."
        }
        settingLabel.text = "Split between \(peopleAmount!) people with \(tipAmount!)% tip."
    }
    @IBAction func recalculatePressed(_ sender: UIButton)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    

}
