//
//  CalculateViewController.swift
//  BMI My Calck
//
//  Created by Konstantin on 31.03.2022.
//

import UIKit

class CalculateViewController: UIViewController {
    
    private var calculatorBrain = CalculateBrain()
    
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var weightLabel: UILabel!
    
    @IBOutlet var heightSlider: UISlider!
    @IBOutlet var weightSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightLabel.text = String(format: "%.2f", sender.value) + " m"
    }
    
    @IBAction func weightSliderChange(_ sender: UISlider) {
        weightLabel.text = String(format: "%.0f", sender.value) + " Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResults", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "goToResults" else { return }
        guard let resultVC = segue.destination as? ResultViewController else { return }
        
        resultVC.modalPresentationStyle = .fullScreen
        resultVC.modalTransitionStyle = .flipHorizontal
        resultVC.bmiValue = calculatorBrain.getBMIValue()
        resultVC.color = calculatorBrain.getColor()
        resultVC.advice = calculatorBrain.getAdvice()
    }

}

