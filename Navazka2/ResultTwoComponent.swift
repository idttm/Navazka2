//
//  ResultTwoComponent.swift
//  Navazka2
//
//  Created by Andrew Cheberyako on 04.08.2020.
//  Copyright © 2020 Andrew Cheberyako. All rights reserved.
//

import Foundation
import UIKit

class  ResultTwoComponent: ViewController {

   var resultElement = TwoComponentViewController()
    
    @IBOutlet weak var resultView: UILabel!
    

    override func viewDidLoad() {
    super.viewDidLoad()
        resultView.text = TwoComponentViewController.outputReseult()
    }
    
}
