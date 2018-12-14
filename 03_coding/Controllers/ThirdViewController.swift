//
//  ThirdViewController.swift
//  03_coding
//
//  Created by Jair Benítez on 12/12/18.
//  Copyright © 2018 Jair Benítez. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    var fontFamilies : [String] = []
    var fonts : [String : [String]] = [:]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        fontFamilies = UIFont.familyNames.sorted(by: { $1 > $0 } )
        
        for fam in fontFamilies {
            print( fam )
            fonts[fam] = UIFont.fontNames(forFamilyName: fam)
        }
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Metodos de protocolo UITableViewdataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.fontFamilies.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell( withIdentifier: "FontFamilyCell", for: indexPath )
        let fontFamily = fontFamilies[indexPath.row]
        cell.textLabel?.text = fontFamily
        cell.textLabel?.font = UIFont(name: fontFamily, size: 20)
        return cell
    }
    

}
