//
//  FirstViewController.swift
//  03_coding
//
//  Created by Jair Benítez on 12/12/18.
//  Copyright © 2018 Jair Benítez. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var sliderAger: UISlider!
    
    var userAge : Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateAgeLabel()
    }


    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
   
        if let theText = textField.text {
            print(theText)
        }
        
        return true
        
    }
    
    @IBAction func ageSlider(_ sender: UISlider) {
        
        updateAgeLabel()
    }
    
    
    
    func updateAgeLabel() {
        
        userAge = Int( self.sliderAger.value )
        self.ageLabel.text = "\(userAge)"
    }
}

