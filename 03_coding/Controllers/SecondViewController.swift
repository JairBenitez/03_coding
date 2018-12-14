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
    @IBOutlet weak var labelSwitch: UILabel!
    
    var fibonacci : [Int] = [0, 1]
    var fibId = 0
    var wantsGoldNum = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        actualizaEtiquetas( n: Int( steper.value ) )
        
    }


    
    
    @IBAction func steperControl(_ sender: UIStepper) {
        
    
        actualizaEtiquetas( n: Int( sender.value ) )
        
    }
    
    
    @IBAction func switchMoved(_ sender: UISwitch) {
        
        wantsGoldNum = sender.isOn
        calculaNumeroDeOro()
        
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
    
    
    
    func actualizaEtiquetas(n: Int) {
        
        fibId = n
        labelStep.text = "\(fibId)"
        
        genraFibNumber()
        calculaNumeroDeOro()
        
    }
    
    
   
    func calculaNumeroDeOro() {
        
        if wantsGoldNum {
            
            let ultimo = Double( fibonacci[fibonacci.count - 1] )
            let anterior = Double( fibonacci[fibonacci.count - 2] )
            let goldNum = ultimo / anterior
            
            labelSwitch.text = "\(goldNum)"
            
        } else {
            
            labelSwitch.text = "Ver el número de oro"
            
        }
    }
    
}

