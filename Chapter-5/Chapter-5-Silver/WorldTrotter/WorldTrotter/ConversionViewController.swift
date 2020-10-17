//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Waleed Alassaf on 13/10/2020.
//

import UIKit

class ConversionViewController: UIViewController {
    //var UIBackgroundView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ConversionViewController loaded")
        

    }
    override func viewWillAppear(_ animated: Bool) {
        makeGradienColor()
    }
    override func loadView() {
        super.loadView()
    
        let fahrenheitLable = UILabel()
        fahrenheitLable.text = "212"
        self.view.addSubview(fahrenheitLable)
        let fahrenheitXConstraint = fahrenheitLable.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let fahrenheitYConstraint = fahrenheitLable.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -280)
        fahrenheitLable.layer.zPosition = 100

        fahrenheitXConstraint.isActive = true
        fahrenheitYConstraint.isActive = true
        
        fahrenheitLable.font = UIFont.systemFont(ofSize: 75)
        fahrenheitLable.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        fahrenheitLable.translatesAutoresizingMaskIntoConstraints = false

        let fahLable = UILabel()
        fahLable.text = "Degrees Fahrenheit"
        self.view.addSubview(fahLable)
        let fahitXConstraint = fahLable.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let fahitYConstraint = fahLable.topAnchor.constraint(equalTo: fahrenheitLable.bottomAnchor, constant: 70)
        fahLable.layer.zPosition = 100

        fahitXConstraint.isActive = true
        fahitYConstraint.isActive = true
        fahLable.font = UIFont.systemFont(ofSize: 25)
        fahLable.translatesAutoresizingMaskIntoConstraints = false
        
        let Lable1 = UILabel()
        Lable1.text = "Is actually"
        self.view.addSubview(Lable1)
        let Lable1XConstraint = Lable1.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let Lable1YConstraint = Lable1.topAnchor.constraint(equalTo: fahLable.bottomAnchor, constant: 70)
        Lable1.layer.zPosition = 100
        Lable1XConstraint.isActive = true
        Lable1YConstraint.isActive = true
        
        Lable1.font = UIFont.systemFont(ofSize: 25)
        Lable1.translatesAutoresizingMaskIntoConstraints = false
        
        let celsiusLable = UILabel()
        celsiusLable.text = "100"
        self.view.addSubview(celsiusLable)
        let a3 = celsiusLable.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let b3 = celsiusLable.topAnchor.constraint(equalTo: Lable1.bottomAnchor, constant: 70)
        a3.isActive = true
        b3.isActive = true
        celsiusLable.layer.zPosition = 100
        celsiusLable.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        celsiusLable.font = UIFont.systemFont(ofSize: 75)
        celsiusLable.translatesAutoresizingMaskIntoConstraints = false
    
        let Lable2 = UILabel()
        Lable2.text = "Degrees celsius"
        self.view.addSubview(Lable2)
        Lable2.layer.zPosition = 100
        Lable2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        Lable2.topAnchor.constraint(equalTo: celsiusLable.bottomAnchor, constant: 70).isActive = true
        Lable2.font = UIFont.systemFont(ofSize: 25)
        Lable2.translatesAutoresizingMaskIntoConstraints = false
            
    }
    func makeGradienColor (){
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.view.bounds
        let randomColors = [ UIColor.blue.cgColor, UIColor.gray.cgColor, UIColor.red.cgColor, UIColor.green.cgColor]
        
        gradientLayer.colors = [randomColors.randomElement()!, randomColors.randomElement()!,randomColors.randomElement()!,randomColors.randomElement()! ]
        
        view.layer.addSublayer(gradientLayer)
        //view.layer.zPosition = -100
        
    }
}
