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
    
    var cofficients = [CofficientModel]()
    
    @IBOutlet weak var volumeView: UITextField!
    @IBOutlet weak var porosityView: UITextField!
    @IBOutlet weak var nomberElementView: UILabel!
    @IBOutlet weak var cofficientView: UITextField!
    
    func resultTwo () -> Double {
        let volume = volumeView.text!
        let porosity = porosityView.text!
        var defaultCoeffic:Double = 1.01
        let porosity1:Double = 1 - (Double(porosity)! / 100)
        if let coeffic1 = cofficientView.text,
           let doubleValue = Double(coeffic1) {
           defaultCoeffic = doubleValue
        }
        let result:Double = Double(volume)! * porosity1 * Double(defaultCoeffic) * totalDansity()
        print(result)
        return result
       
        
    }
    
    func resultEveryElement () {
        var elements = [Double]()
        var endElement = [Double]()
        var reslutArray = [Double]()
        let elements2 = cofficients.map({$0.procient})
        elements.append(contentsOf: elements2)
        reslutArray = elements2.map({$0 * resultTwo()})
        endElement.append(contentsOf: reslutArray.map({$0 / 100}))
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
        cofficients = cofficient
    }
    
    func totalDansity() -> Double {
        var resultDovn = [Double]()
        cofficients.enumerated().forEach { (index,velue) in
            let result = cofficients.map({$0.value})//.reduce(index,*)
            let newResult:Double = result.reduce(1,*)/velue.value * (velue.procient/100)
            resultDovn.append(newResult)
        }
        let resultSumm = resultDovn.reduce(0,+)
        let summUp = cofficients.map({$0.value})
        let newSummUp = summUp.reduce(1,*)
        let endResult = newSummUp / resultSumm
        return endResult
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        
        nomberElementView.text = String(sender.value)
    }
    
    @IBAction func countResult(_ sender: UIButton) {
        resultEveryElement()
        
    }
    
}
