//
//  ViewController.swift
//  SpeedTypingApp
//
//  Created by Philip Miranda on 2023-03-22.
//

import UIKit

class ViewController: UIViewController {
    
    let segueToGame = "segueToGame"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func pressButtonAction(_ sender: UIButton) {
        performSegue(withIdentifier: segueToGame, sender: self)
        
    }
    
    
    
}


