//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Waleed Alassaf on 13/10/2020.
//

import UIKit

class ConversionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ConversionViewController loaded")
        makeGradienColor()
    }
    override func viewWillAppear(_ animated: Bool) {
        makeGradienColor()
    }
    
    @IBOutlet weak var UIBackgroundView: UIView!
    
    func makeGradienColor (){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = UIBackgroundView.bounds
        
        let randomColors = [UIColor.red.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor, UIColor.yellow.cgColor, UIColor.purple.cgColor]
        
        gradientLayer.colors = [randomColors.randomElement(), randomColors.randomElement(),randomColors.randomElement(),randomColors.randomElement() ]
        
        UIBackgroundView.layer.addSublayer(gradientLayer)
    }
    
    
}

