//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Waleed Alassaf on 13/10/2020.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ConversionViewController loaded")
        makeGradienColor()
        UpdateCelsiusLable()
    }
    override func viewWillAppear(_ animated: Bool) {
        makeGradienColor()
    }
    
    @IBOutlet weak var fahrenheitLable: UITextField!
    @IBOutlet weak var CelciusLable: UITextField!


    override func loadView() {
        super.loadView()
    
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
      
        let allowedInputs = CharacterSet.init(charactersIn: "1234567890.,")
        
        let isBackSpace = strcmp(string, "\\b")
                if (isBackSpace == -92) {
                    return true
                }
        
        guard let _ = string.rangeOfCharacter(from: allowedInputs) else {
            return false
        }
        
        let currentLocal = Locale.current
        let decimalSeperator = currentLocal.decimalSeparator ?? "."
    
        
        let existingTextHasDecimalSeparator = textField.text?.range(of: decimalSeperator)
        let replacmentTextHasDecimalSeparator = string.range(of: decimalSeperator)
        
        if existingTextHasDecimalSeparator != nil, replacmentTextHasDecimalSeparator != nil {
            return false
        }else{
            return true
        }
    
    }
    
    var fahrenhietValue: Measurement<UnitTemperature>?{
        didSet{  UpdateCelsiusLable()   }
    }
    var celciusValue: Measurement<UnitTemperature>?{
        if let fahValue = fahrenhietValue {
            return fahValue.converted(to: .celsius)
        }else {
            return nil
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.maximumFractionDigits = 1
        nf.minimumFractionDigits = 0
        return nf
    }()
    
    @IBAction func fahrenheitFieldChanged(_ textField: UITextField) {
        
//        if let text = textField.text, let doubleText = Double(text){
//            fahrenhietValue = Measurement(value: doubleText, unit: .fahrenheit)
//        }
        if let text = textField.text, let number1 = numberFormatter.number(from: text){
            fahrenhietValue = Measurement(value: number1.doubleValue, unit: .fahrenheit)
        }else {
            fahrenhietValue = nil
        }
    }
    
    func UpdateCelsiusLable (){
        
        if let CelValue = celciusValue {
            CelciusLable.text = numberFormatter.string(from: NSNumber(value: CelValue.value))
        }else {
            CelciusLable.text = ""
            
        }
    }
    
    @IBAction func CelLable(_ sender: Any) {
        
    }
    
    @IBAction func dissmissKeyboard(_ sender: UITapGestureRecognizer) {
        fahrenheitLable.resignFirstResponder()
        CelciusLable.resignFirstResponder()
    }
    
    func makeGradienColor (){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.zPosition = -100
        
        let randomColors = [UIColor.red.cgColor, UIColor.purple.cgColor]
        
        gradientLayer.colors = [randomColors.randomElement()!, randomColors.randomElement()!,randomColors.randomElement()! ]
        
        view.layer.addSublayer(gradientLayer)
    }
}

