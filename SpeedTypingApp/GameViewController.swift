//
//  GameViewController.swift
//  SpeedTypingApp
//
//  Created by Philip Miranda on 2023-03-22.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var scoreBoard: UILabel!
    @IBOutlet weak var timeLable: UILabel!
    @IBOutlet weak var typingTextField: UITextField!
    @IBOutlet weak var randomWordLable: UILabel!
    @IBOutlet weak var gameTimerLabel: UILabel!
    
    let segueToGameOver = "SegueToGameOver"
    
    let words = ["Apple", "Forest", "Dog", "Flower", "Green", "Potato", ]
    
    var timer: Timer?
    
    var score = 0
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        randomWordLable.text = words.randomElement()
        
        
        
        gameTimer()
        
        timerLabelFunc()
        
        
        
        
        
        
    }
    
    func removePoints () {
        
        var valuePoints = Int(scoreBoard.text!) ?? 0
        
        
        valuePoints -= 1
        score -= 1
        
        
        scoreBoard.text = valuePoints.description
        
        
        if valuePoints == -10 {
            
            
            //gameFinish()
        }
        
    }
    
    func addPoints() {
        
        var valuePoints = Int(scoreBoard.text!) ?? 0
        
        
        valuePoints += 1
        
        score += 1
        
        scoreBoard.text = valuePoints.description
        
        if valuePoints == 10 {
            
            
            
            
            //gameFinish()
        }
        
    }
    
    
    
    
    
    func displayWordsInLabel(words: [String], label: UILabel, typingTextField: UITextField) {
        
        
        guard let typedWord = typingTextField.text else {
            return
        }
        
        if words.contains(typedWord) {
            print("1 Point!")
            label.text = words.randomElement()
            typingTextField.text = ""
            
            addPoints()
            
            timeLable.text = "8"
            timer?.invalidate()
            timerLabelFunc()
            
            
            
        } else {
            print("-1 Point!")
            typingTextField.text = ""
            
            removePoints()
            
            timeLable.text = "8"
            timer?.invalidate()
            timerLabelFunc()
            
            
            
        
            
            
        }
    }
    
//
    
    func gameTimer () {
            
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [self] timer in
                
                                
                var valueTime = Int(gameTimerLabel.text!) ?? 30
                
                valueTime -= 1
                
                gameTimerLabel.text = valueTime.description
                
                if valueTime == 0 {
                    
                    timer.invalidate()
                    
                    performSegue(withIdentifier: segueToGameOver, sender: self)
                    
                    
                }
            })
            
        
    }
    
    
    func timerLabelFunc() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [self] timer in
            
            var valueTime = Int(self.timeLable.text!) ?? 8
            
            valueTime -= 1
            
            self.timeLable.text = valueTime.description
            
            if valueTime == 0 {
                
                
                checkWordButton(UIButton())
                
                timeLable.text = "8"
                timer.invalidate()
                
                
                
                
            }
        })
        
        
    }
    
    
    // Old function for checking if the game is over
    
//    func gameFinish () {
//
//
//        timer?.invalidate()
//
//        guard let scoreText = scoreBoard.text, let score = Int(scoreText) else {
//            print("Error: unable to read scoreBoard text as integer")
//            return
//        }
//
//        if score == 10 {
//            print("You Win!")
//            performSegue(withIdentifier: segueToGameOver, sender: self)
//        } else if score == -10 {
//            print("You Lose!")
//            performSegue(withIdentifier: segueToGameOver, sender: self)
//        }
//    }
            
    
    
    
    
    
    // Press enter to check word.
    @IBAction func primartActionTriggered(_ sender: UITextField) {
        displayWordsInLabel(words: words, label: randomWordLable, typingTextField: typingTextField)
        
        
    }
    // Press the button to check word.
    @IBAction func checkWordButton(_ sender: UIButton) {
        displayWordsInLabel(words: words, label: randomWordLable, typingTextField: typingTextField)
        
        
        
    }

    
    
    
    
    
    
}
