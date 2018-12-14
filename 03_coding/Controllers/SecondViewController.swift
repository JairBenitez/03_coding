//
//  SecondViewController.swift
//  03_coding
//
//  Created by Jair Benítez on 12/12/18.
//  Copyright © 2018 Jair Benítez. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var labelStep: UILabel!
    @IBOutlet weak var fibResult: UITextView!
    @IBOutlet weak var steper: UIStepper!
    
    var fibonacci : [Int] = [0, 1]
    var fibId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        actualizaEtiquetas( n: Int( steper.value ) )
        
    }


    func genraFibNumber( ) {
        
        if( fibId <= 1 || fibId >= 20 ) {
            return
        }
        
        // Generar números
        
        fibonacci = [0, 1]
        
        for i in 2...fibId {
            fibonacci.append(fibonacci[i-1] + fibonacci[i-2])
        }
        
        let fibStr : [String] = fibonacci.compactMap( { String($0) } )
        let result : String = fibStr.joined(separator: "\n")
        fibResult.text = result
        
    }
    
    @IBAction func steperControl(_ sender: UIStepper) {
        
    
        actualizaEtiquetas( n: Int( sender.value ) )
        
    }
    
    func actualizaEtiquetas(n: Int) {
        
        fibId = n
        labelStep.text = "\(fibId)"
        
        genraFibNumber()
    }
    
}

