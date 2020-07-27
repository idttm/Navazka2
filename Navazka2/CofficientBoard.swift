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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if elementValue == 3 {
            nameThreeElementView.isHidden = false
            valueThreeElementView.isHidden = false
            percentThreeElementView.isHidden = false
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
            let value3String = valueTwoElementView.text,
            let value3Double = Double(value3String),
            let percent3 = percentThreeElementView.text,
            let percent3Double = Double(percent3) {
            let value3 = CofficientModel(name: name3, value: value3Double, procient: percent3Double)
            values.append(value3)
        }
        
        deligete?.saveCofficients(cofficient: values)
        dismiss(animated: true)
        

    }
    

    
}
