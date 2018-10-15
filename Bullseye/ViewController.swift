//
//  ViewController.swift
//  Bullseye
//
//  Created by Phi Hoang Huy on 10/15/18.
//  Copyright © 2018 Phi Hoang Huy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
var currentValue : Int = 50
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
@IBAction func showAlert() {
    let message = "The value of the slider is: \(currentValue)"
    let alert = UIAlertController(title: "Hello, World",
                                  message: message,
                                  preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default,
                               handler: nil)
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
    }
    @IBAction func sliderMoved(_ sender: UISlider) {
        currentValue = lroundf(sender.value)
    }
}

