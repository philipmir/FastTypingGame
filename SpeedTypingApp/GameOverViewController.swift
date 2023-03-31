//
//  GameOverViewController.swift
//  SpeedTypingApp
//
//  Created by Philip Miranda on 2023-03-26.
//

import UIKit


class GameOverViewController: UIViewController {
    
    let restartGameSegue = "restartGameSegue"

    @IBOutlet weak var endPoints: UILabel!
    
    
    var score: Int = 0 // Add a variable to hold the score
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
                // Get the score from GameViewController
                let gameViewController = presentingViewController as? GameViewController
                score = gameViewController?.score ?? 0
                
                // Display the score in endPoints label
                endPoints.text = "You got \(score) points!"
        
                      

        
    }
    
    

    
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: restartGameSegue, sender: self)
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
