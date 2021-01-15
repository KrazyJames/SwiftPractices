//
//  ViewController.swift
//  AutoLayout
//
//  Created by Jaime Escobar on 20/07/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myView = UIView()
        view.addSubview(myView)
        myView.backgroundColor = .red
        print("yellow")
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.heightAnchor.constraint(equalToConstant: 128).isActive = true
        myView.widthAnchor.constraint(equalToConstant: 128).isActive = true
        myView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        myView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
    }


}

