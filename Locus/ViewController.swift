//
//  ViewController.swift
//  Locus
//
//  Created by Pramod Repaka on 2019-09-18.
//  Copyright © 2019 Pramod Repaka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 50
    var targetValue = 0
    var score = 0
    var round = 0
    var bonus = 0
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var txtScore: UILabel!
    @IBOutlet var txtRound: UILabel!
    @IBOutlet var txtTargetVal: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txtScore.text = "\(score)"
        txtRound.text = "\(round)"
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewRound()
        updateLabels()
    }

    @IBAction func showAlert(_ sender: UIButton) {
        
    
        let difference = abs(currentValue - targetValue)
        let points = 100 - difference
        let title: String
        
        if difference == 0 {
            bonus = 100
            title = "Perfect!"
        } else if difference < 5 {
            if difference == 1{
                bonus = 50
            }
            title = "You almost had it!"
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        score += points + bonus
        
        let message = "You scored \(points) points"
        let alert = UIAlertController(title: title ,message: message,preferredStyle: .alert)
        let action = UIAlertAction(title: "ok",style: .default,handler: {
            action in
            self.updateLabels()
        })
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func startNewRound(){
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    @IBAction func startNewGame(_ sender: UIButton) {
        startNewRound()
        score = 0
        round = 0
        bonus = 0
        updateLabels()
    }
    
    func updateLabels(){
        txtTargetVal.text = String(targetValue)
        txtScore.text = String(score)
        txtRound.text = String(round)
    }
}

