//
//  FirstViewController.swift
//  03_coding
//
//  Created by Jair Benítez on 12/12/18.
//  Copyright © 2018 Jair Benítez. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
   
        if let theText = textField.text {
            print(theText)
        }
        
        return true
        
    }
    
}

