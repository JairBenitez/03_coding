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
    
    @IBOutlet weak var nameText: UITextField!
    
    var userAge : Int = -1
    var userName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateAgeLabel()
    }


    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
   
        if let theText = textField.text {
           
            userName = theText
        }
        
        return true
        
    }
    
    @IBAction func ageSlider(_ sender: UISlider) {
        
        updateAgeLabel()
    }
    
    
    @IBAction func validaDatos(_ sender: UIButton) {
        
        
        let puedeIngresar = ( userName == "Jair" || userAge >= 18 )
        
        if puedeIngresar {
            
            self.view.backgroundColor = UIColor( red: 105.0/255.0, green: 231.0/255.0, blue: 39.0/255.0, alpha: 0.7 )
            
        } else {
            
            self.view.backgroundColor = UIColor( red: 209.0/255.0, green: 18.0/255.0, blue: 16.0/255.0, alpha: 1 )
            
        }
        
        
        /*
        if userName == "Jair" {
            
            print("Ingresa")
            self.view.backgroundColor = UIColor( red: 20.0/255, green: 168.0/255, blue: 247.0/255, alpha: 0.7 )
            
        } else {
            if userAge > 18 {
                
                print("Ingresa")
                self.view.backgroundColor = UIColor( red: 105.0/255.0, green: 231.0/255.0, blue: 39.0/255.0, alpha: 0.7 )
                
            } else {
                
                print("No puedes ingresar")
                self.view.backgroundColor = UIColor( red: 221.0/255.0, green: 79.0/255.0, blue: 67.0/255.0, alpha: 1 )
                
            }
        }
        */
        
    }
    
    func updateAgeLabel() {
        
        userAge = Int( self.sliderAger.value )
        self.ageLabel.text = "\(userAge)"
    }
}

