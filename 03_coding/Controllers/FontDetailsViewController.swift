//
//  FontDtailsViewController.swift
//  03_coding
//
//  Created by Jair Benítez on 14/12/18.
//  Copyright © 2018 Jair Benítez. All rights reserved.
//

import UIKit

class FontDetailsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var familyName : String = ""
    var fonts : [String] = []
    
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var pickerFonts: UIPickerView!
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        labelTitle.text = familyName
        labelTitle.font = UIFont(name: familyName, size: 20.0)
        
        if fonts.count == 0 {
            pickerFonts.isHidden = true
        }
        
        textView.font = UIFont(name: familyName, size: 16.0 )
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func buttonDonePressed(_ sender: UIBarButtonItem) {
        
        self.dismiss( animated: true )
       
    }
    
    // MARK: - UIPickerView Data source methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // en este caso solo neceitasmos una
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.fonts.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fonts[row]
    }
    
    
    // MARK: - UIPickerview Delegate methids
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let font = fonts[row]
        textView.font = UIFont(name: font, size: 16.0 )
    }

    
}
