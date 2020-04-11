//
//  ViewController.swift
//  AntiBully
//
//  Created by Fred Lefevre on 2020-04-10.
//  Copyright © 2020 Fred Lefevre. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var predictionLabel: UILabel!
    @IBOutlet weak var sentenceTextField: UITextField!
    
    var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sentenceTextField.delegate = self
        sentenceTextField.becomeFirstResponder()
    }

    @IBAction func analyzeButtonPressed(_ sender: Any) {
        guard sentenceTextField.text != "" else {
            predictionLabel.text = "Please enter a sentence below."
            return
        }
        
        guard let sentence = sentenceTextField.text else { return }
        viewModel = ViewModel(textData: sentence)
        predictionLabel.text = viewModel.sentiment.text
        sentenceTextField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        analyzeButtonPressed(sentenceTextField as Any)
        return true
    }
    
}

