//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Jaime Escobar on 06/04/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var result: String = "0"
    var split: Int = 0
    var tip: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = self.result
        settingsLabel.text = "Split between \(split) people, with \(tip)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
