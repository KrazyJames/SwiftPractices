//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Jaime on 01/18/2019.

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ballImageView: UIImageView!
    let ballArray = [#imageLiteral(resourceName: "ball1.png"),#imageLiteral(resourceName: "ball2.png"),#imageLiteral(resourceName: "ball3.png"),#imageLiteral(resourceName: "ball4.png"),#imageLiteral(resourceName: "ball5.png")]


    @IBAction func askBtn(_ sender: UIButton) {
        ballImageView.image = ballArray.randomElement()
    }
    
}

