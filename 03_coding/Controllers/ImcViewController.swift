//
//  ImcViewController.swift
//  03_coding
//
//  Created by Jair Benítez on 14/12/18.
//  Copyright © 2018 Jair Benítez. All rights reserved.
//

import UIKit

class ImcViewController: UIViewController {

    
    @IBOutlet weak var labelEstatura: UILabel!
    @IBOutlet weak var labelPeso: UILabel!
    @IBOutlet weak var labelIMC: UILabel!
    
    @IBOutlet weak var ClasificacionViewImage: UIImageView!
    @IBOutlet weak var labelClasificacion: UILabel!
    @IBOutlet weak var scrollEstatura: UISlider!
    @IBOutlet weak var sliderPeso: UISlider!
    @IBOutlet weak var switchIMC: UISwitch!
    
    var estatura : Int = 0
    var peso : Int = 0
    var imc : Float = 0.0
    let clasificaciones : [String] = ["Bajo Peso", "Normal", "Sobre Peso", "Obseidad"]
    let images : [String] = ["bajopeso","normal","sobrepeso","obesidad"]
    var clasificacionIdx = 0
    var clasificacion = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        actualizaEstatura()
        actualizaPeso()
        calculaIMC()
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
   
    
    
    @IBAction func sliderPesoChanged(_ sender: UISlider) {
        actualizaPeso()
        calculaIMC()
    }
    
    
    @IBAction func sliderEstaturaChanged(_ sender: UISlider) {
        actualizaEstatura()
        calculaIMC()
    }
    
    
    @IBAction func swImcChanged(_ sender: UISwitch) {
        
        if sender.isOn {
            calculaIMC()
            ClasificacionViewImage.isHidden = false
        } else {
            labelClasificacion.text = ""
            labelIMC.text = "Ver indice de masa corporal"
            ClasificacionViewImage.isHidden = true
        }
    }
    
    func actualizaEstatura() {
        
        self.estatura = Int(scrollEstatura.value)
        labelEstatura.text = "\(estatura)"
        
    }
    
    func actualizaPeso() {
        
        self.peso = Int( sliderPeso.value )
        
        labelPeso.text = "\(peso)"
    }
    
    func calculaIMC() {
        
        if switchIMC.isOn {
        
            let estaturaEnMetros : Float =  Float( estatura ) / 100.0
            self.imc = Float( peso ) / ( estaturaEnMetros * estaturaEnMetros )
           
            
            if self.imc < 18.5 {
                clasificacionIdx = 0
            }
            
            if self.imc < 24.99 && self.imc >= 18.5 {
                clasificacionIdx = 1
            }
            
            if self.imc < 30 && self.imc >= 25 {
                clasificacionIdx = 2
            }
            
            if self.imc >= 30 {
                clasificacionIdx = 3
            }
            
            self.clasificacion = self.clasificaciones[self.clasificacionIdx]
            
            labelIMC.text = "I.M.C. = (\(self.imc))"
            labelClasificacion.text = self.clasificacion
            
            ClasificacionViewImage.image = UIImage(named: self.images[self.clasificacionIdx] )
        }
    
    }
    
    
}
