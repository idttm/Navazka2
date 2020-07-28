//
//  TwoComponent.swift
//  Navazka2
//
//  Created by Andrew Cheberyako on 25.07.2020.
//  Copyright © 2020 Andrew Cheberyako. All rights reserved.
//

import Foundation
import UIKit

class TwoComponentViewController: UIViewController, CofficientBoardDelegate {
    
    
    
    @IBOutlet weak var volumeView: UITextField!
    @IBOutlet weak var porosityView: UITextField!
    @IBOutlet weak var nomberElementView: UILabel!
    @IBOutlet weak var cofficientView: UITextField!
    
    func resultTwo () {
        let volume = volumeView.text!
        let porosity = porosityView.text!
        var defaultCoeffic:Double = 1.01
        let porosity1:Double = 1 - Double(porosity)! / 100
        if let coeffic1 = cofficientView.text, let doubleValue = Double(coeffic1) {
           defaultCoeffic = doubleValue
        }
        var result:Double = Double(volume)! * Double(porosity)! * Double(defaultCoeffic) * porosity1
        
    }
    

    @IBAction func showCofficientBoardAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
       guard let vc = storyboard.instantiateViewController(withIdentifier: "CofficientBoard") as? CofficientBoard
        else { return }
        if let nomberElement = nomberElementView.text,
            let newNoberElement = Double(nomberElement) {
            vc.elementValue = Int(newNoberElement)
            
        }
        vc.deligete = self
        present(vc, animated: true)
    }
    func saveCofficients(cofficient: [CofficientModel]) {
    print(cofficient)
    }
    
    func totalDansity() {
        if let nomberElement = nomberElementView.text,
            let newNoberElement = Int(nomberElement)
        {
            if newNoberElement == 2 {
                self.values
            }
            
        }
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        
        nomberElementView.text = String(sender.value)
    }
    
    @IBAction func countResult(_ sender: UIButton) {
        
        
    }
    
    
    
    
}
