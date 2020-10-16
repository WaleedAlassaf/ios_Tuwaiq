//
//  QuizViewController.swift
//  WorldTrotter
//
//  Created by Waleed Alassaf on 14/10/2020.
//

import UIKit

class QuizViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBOutlet weak var AnswerLable: UILabel!
    @IBOutlet weak var Question: UILabel!
    
    var QuestionNumber = 0
    @IBAction func showAnswer(_ sender: UIButton) {
        if QuestionNumber == 0 {
            AnswerLable.text = "8"
        }else if QuestionNumber == 1{
            AnswerLable.text = "4"
        }
    
    }
    @IBAction func nextQuistion(_ sender: UIButton) {
    
        AnswerLable.text = "??"
        Question.text = "What's 2x2?"
        QuestionNumber += 1
        
        if QuestionNumber == 2 {
            AnswerLable.text = "?"
            Question.text = "What's 4 + 4"
            QuestionNumber = 0
        }
    }
}

