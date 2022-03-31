//
//  CalculateViewController.swift
//  BMI My Calck
//
//  Created by Konstantin on 31.03.2022.
//

import UIKit

class CalculateViewController: UIViewController {
    
    private var bmiValue = "0.0"
    
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
        let bmi = weight / ( height * height )
        bmiValue = String(format: "%.1f", bmi)
        
        self.performSegue(withIdentifier: "goToResults", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "goToResults" else { return }
        guard let resultVC = segue.destination as? ResultViewController else { return }
        
        resultVC.modalPresentationStyle = .fullScreen
        resultVC.modalTransitionStyle = .flipHorizontal
        resultVC.bmiValue = bmiValue
    }

}

