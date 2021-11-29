//
//  ViewController.swift
//  Guess the flag
//
//  Created by Karina Martins Silva on 14/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var buttonOne: UIButton!
    @IBOutlet var buttonTwo: UIButton!
    @IBOutlet var buttonThree: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questions = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        countries += ["Estonia", "France","Germany","Ireland","Italy","Monaco","Nigeria","Poland","Russia","UK","US"]
        
        buttonOne.layer.borderWidth = 1
        buttonTwo.layer.borderWidth = 1
        buttonThree.layer.borderWidth = 1
        
        buttonOne.layer.borderColor = UIColor.lightGray.cgColor
        buttonTwo.layer.borderColor = UIColor.lightGray.cgColor
        buttonThree.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion(action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(scoreShare))
    }

    func askQuestion(action: UIAlertAction!) {
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        buttonOne.setImage(UIImage(named: countries[0]), for: .normal)
        buttonTwo.setImage(UIImage(named: countries[1]), for: .normal)
        buttonThree.setImage(UIImage(named: countries[2]), for: .normal)
        
        title =  countries[correctAnswer].uppercased()
      
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            questions += 1
        } else {
            title = "Wrong! That's the flag of \(countries[sender.tag].uppercased())"
            score -= 1
            questions += 1
        }
        
        let ac = UIAlertController(title: title, message: "Go to the next flag!", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
        
//if reaches 10 questions, show ending
//        if questions == 10 {
//        ac.dismiss(animated: true, completion: {
//         let final = UIAlertController(title: "Current Score", message: "Your score \(self.score)", preferredStyle: .alert)
//      final.addAction(UIAlertAction(title: "Back to game", style: .cancel, handler: nil))
        //self.present(final, animated: true)
        
//            self.score = 0
//            self.questions = 0
//            self.askQuestion(action: nil)
//        })
//        }
    }
    @objc func scoreShare() {
        let final = UIAlertController(title: "Current Score", message: "Your score \(self.score)", preferredStyle: .alert)
        final.addAction(UIAlertAction(title: "Back to game", style: .cancel, handler: nil))
        self.present(final, animated: true)
        
    }
}

