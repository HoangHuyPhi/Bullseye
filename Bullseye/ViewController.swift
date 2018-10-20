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
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        sender.setThumbImage(thumbImageNormal, for: .normal)
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        sender.setThumbImage(thumbImageHighlighted, for: .highlighted)
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable =
            trackLeftImage.resizableImage(withCapInsets: insets)
        sender.setMinimumTrackImage(trackLeftResizable, for: .normal)
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable =
            trackRightImage.resizableImage(withCapInsets: insets)
        sender.setMaximumTrackImage(trackRightResizable, for: .normal)
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
    @IBAction func startOver(_ sender: Any) {
        score = 0
        round = 0
        startNewRound()
    }
}

