//
//  CofficientBoard.swift
//  Navazka2
//
//  Created by Andrew Cheberyako on 25.07.2020.
//  Copyright © 2020 Andrew Cheberyako. All rights reserved.
//

import Foundation
import UIKit

protocol CofficientBoardDelegate: class {
    func saveCofficients(cofficient: [CofficientModel])
}

 

class CofficientBoard: UIViewController {
    
    var deligete: CofficientBoardDelegate?
   
    var elementValue = 2 
    @IBOutlet weak var nameOneElementView: UITextField!
    @IBOutlet weak var nemeTwoElementView: UITextField!
    @IBOutlet weak var nameThreeElementView: UITextField!
    @IBOutlet weak var nameFourElementView: UITextField!
    @IBOutlet weak var nameFiveElementView: UITextField!
    
    @IBOutlet weak var valueOneElementView: UITextField!
    @IBOutlet weak var valueTwoElementView: UITextField!
    @IBOutlet weak var valueThreeElementView: UITextField!
    @IBOutlet weak var valueFourElementView: UITextField!
    @IBOutlet weak var valueFiveElementView: UITextField!
    
    @IBOutlet weak var percentOneElementView: UITextField!
    @IBOutlet weak var percentTwoElementView: UITextField!
    @IBOutlet weak var percentThreeElementView: UITextField!
    @IBOutlet weak var percentFourElementView: UITextField!
    @IBOutlet weak var percentFiveElementView: UITextField!
    
    @IBOutlet weak var errorTableView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if elementValue == 5 {
            nameFiveElementView.isHidden = false
            valueFiveElementView.isHidden = false
            percentFiveElementView.isHidden = false
            nameFourElementView.isHidden = false
            valueFourElementView.isHidden = false
            percentFourElementView.isHidden = false
            nameThreeElementView.isHidden = false
            valueThreeElementView.isHidden = false
            percentThreeElementView.isHidden = false
        } else if elementValue == 4 {
            nameFourElementView.isHidden = false
            valueFourElementView.isHidden = false
            percentFourElementView.isHidden = false
            nameThreeElementView.isHidden = false
            valueThreeElementView.isHidden = false
            percentThreeElementView.isHidden = false
        } else if elementValue == 3 {
            nameThreeElementView.isHidden = false
            valueThreeElementView.isHidden = false
            percentThreeElementView.isHidden = false
        }
        if errorTableView != nil {
            errorTableView.isHidden = false
        }
        
        
    }
    
    func errorPercent() {
        guard let proc1S = percentOneElementView.text,
            let proc1D = Double(proc1S),
            let proc2S = percentTwoElementView.text,
            let proc2D = Double(proc2S),
            let proc3S = percentThreeElementView.text,
            let proc3D = Double(proc3S),
            let proc4S = percentFourElementView.text,
            let proc4D = Double(proc4S),
            let proc5S = percentFiveElementView.text,
            let proc5D = Double(proc5S)
            else { return }
        if proc1D + proc2D + proc3D + proc4D + proc5D != 100 {
            errorTableView.text = "Процентноее соотношение компонетнов неверно"
        }
    }
    
    @IBAction func saveAction(_ sender: Any) {
        var values = [CofficientModel]()
        guard let name1 = nameOneElementView.text,
            let name2 = nemeTwoElementView.text,
            let value1Sring = valueOneElementView.text,
            let value2Sring = valueTwoElementView.text,
            let value1Double = Double(value1Sring),
            let value2Double = Double(value2Sring),
            let percent1Sring  = percentOneElementView.text,
            let percent2Sring = percentTwoElementView.text,
            let percent1Double = Double(percent1Sring),
            let percent2Double = Double(percent2Sring)
            else { return }
        let value1 = CofficientModel(name: name1, value: value1Double, procient: percent1Double)
        let value2 = CofficientModel(name: name2, value: value2Double, procient: percent2Double)
        values.append(contentsOf: [value1, value2])
        
        if elementValue == 3,
            let name3 = nameThreeElementView.text,
            let value3String = valueThreeElementView.text,
            let value3Double = Double(value3String),
            let percent3 = percentThreeElementView.text,
            let percent3Double = Double(percent3) {
            let value3 = CofficientModel(name: name3, value: value3Double, procient: percent3Double)
            values.append(value3)
        }
        
        if elementValue == 4,
            let name4 = nameFourElementView.text,
            let value4String = valueFourElementView.text,
            let value4Double = Double(value4String),
            let percent4 = percentFourElementView.text,
            let percent4Double = Double(percent4) {
            let value4 = CofficientModel(name: name4, value: value4Double, procient: percent4Double)
            values.append(value4)
        }
        
        if elementValue == 5,
            let name5 = nameFiveElementView.text,
            let value5String = valueFiveElementView.text,
            let value5Double = Double(value5String),
            let percent5 = percentFiveElementView.text,
            let percent5Double = Double(percent5) {
            let value5 = CofficientModel(name: name5, value: value5Double, procient: percent5Double)
            values.append(value5)
        }
        
        let arrayProcent = [percentOneElementView.text, percentTwoElementView.text, percentThreeElementView.text, percentFourElementView.text, percentFiveElementView.text]
        let result = arrayProcent.compactMap({$0}).map({Double($0)}).compactMap({$0}).reduce(0,+)
        if result == 100 {
            deligete?.saveCofficients(cofficient: values)
            dismiss(animated: true)
        } else {
        errorTableView.text = "Процентноее соотношение компонетнов неверно"
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(false)
        return false
    }
    @IBAction func noKayboardAction(_ sender: UITapGestureRecognizer) {
        textFieldShouldReturn(nameOneElementView)
        
    }
    
}
    
    
    
    
    
    
    
    
    
    

