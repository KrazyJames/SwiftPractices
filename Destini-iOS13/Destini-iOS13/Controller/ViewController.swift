//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        load()
    }
    
    @IBAction func choice1Pressed(_ sender: UIButton) {
        storyBrain.setNextStory(choice: 1)
        load()
    }

    @IBAction func choice2Pressed(_ sender: UIButton) {
        storyBrain.setNextStory(choice: 2)
        load()
    }
    
    func load() {
        storyLabel.text = storyBrain.getStory()
        choice1Button.setTitle(storyBrain.getChoices()[0], for: UIControl.State.normal)
        choice2Button.setTitle(storyBrain.getChoices()[1], for: UIControl.State.normal)
    }

}

