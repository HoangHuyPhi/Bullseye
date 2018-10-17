//
//  ViewController.swift
//  Bullseye
//
//  Created by Phi Hoang Huy on 10/15/18.
//  Copyright © 2018 Phi Hoang Huy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var sender: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    var currentValue : Int = 50
    var targetValue: Int = 0
    var score = 0
    var round = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      startNewRound()
      updateLabels()
    }
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
    score += points
        let message = "You scored \(points) points"
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
    let alert = UIAlertController(title: title,
                                  message: message,
                                  preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default,
                               handler: {
                                action in
                                self.startNewRound()
    })
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
    }
    @IBAction func sliderMoved(_ sender: UISlider) {
        currentValue = lroundf(sender.value)
    }
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        sender.value = Float(currentValue)
        updateLabels()
        round += 1
    }
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}

