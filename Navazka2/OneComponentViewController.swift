//
//  OneComponent.swift
//  Navazka2
//
//  Created by Andrew Cheberyako on 21.07.2020.
//  Copyright © 2020 Andrew Cheberyako. All rights reserved.
//

import UIKit


class OneComponentViewController: UIViewController {
    
    
  
    @IBOutlet weak var valumeFinishedProducnt: UITextField!
    @IBOutlet weak var densityElement: UITextField!
    @IBOutlet weak var coefficient1: UITextField!
    @IBOutlet weak var coefficient2: UITextField!
    @IBOutlet weak var resultView: UILabel!
    
    
    func result() -> String {
        let valumeFinished = valumeFinishedProducnt.text!
        let density = densityElement.text!
        let porosity1 = coefficient2.text!
        var defaultCoeffic1:Double = 1.01
        
        let porosity:Double = 1 - Double(porosity1)! / 100
        
        
        if let coeffic1 = coefficient1.text, let doubleValue = Double(coeffic1) {
           defaultCoeffic1 = doubleValue
        }
        
        let result = Double(valumeFinished)! * Double(density)! * defaultCoeffic1 * porosity
        if result > 0 {
            return String(result)
        } else {return "Некорректные данные"}
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func noKeyboard(_ sender: UITapGestureRecognizer) {
        textFieldShouldReturn(valumeFinishedProducnt)
        textFieldShouldReturn(densityElement)
        
    }
    
    
    @IBAction func countAction(_ sender: Any) {
        resultView.text = result()
    }
}
