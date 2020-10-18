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
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //        print("Current text: \(String(describing: textField.text))")
        //        print("Relpacment text: \(string)")
        //        return true
        let allowedInputs = CharacterSet.init(charactersIn: "1234567890.")
        
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacmentTextHasDecimalSeparator = string.range(of: ".")
        
        let isBackSpace = strcmp(string, "\\b")
                if (isBackSpace == -92) {
                    return true
                }
        
        guard let hasLetters = string.rangeOfCharacter(from: allowedInputs) else {
            return false
        }
        
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
        
        
        if let text = textField.text, let doubleText = Double(text){
            fahrenhietValue = Measurement(value: doubleText, unit: .fahrenheit)
        }else {
            fahrenhietValue = nil
        }
        
        // This code works I tried to do the exercise with my own implementation first.
        //
        //        if fahrenheitLable.text == "" { CelciusLable.text = "" }
        //
        //        if let fahValue = fahrenheitLable.text, !fahValue.isEmpty {
        //            if let fahToC = Double(fahValue){
        //
        //                CelciusLable.text = String(round(((fahToC - 32) * 5 ) / 9 ))
        //            }
        //        }
    }
    
    
    func UpdateCelsiusLable (){
        
        if let CelValue = celciusValue {
            //CelciusLable.text = "\(CelValue.value)"
            CelciusLable.text = numberFormatter.string(from: NSNumber(value: CelValue.value))
        }else {
            CelciusLable.text = ""
            
        }
    }
    
    @IBAction func CelLable(_ sender: Any) {
        
        
        //        if CelciusLable.text == "" { fahrenheitLable.text = "" }
        //
        //        if let celValue = CelciusLable.text, !celValue.isEmpty {
        //            if let CtoFah = Double(celValue){
        //
        //                fahrenheitLable.text = String(round((CtoFah * 1.8) + 32 ))
        //            }
        //        }
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

