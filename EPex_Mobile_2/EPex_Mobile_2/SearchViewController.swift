//
//  SearchViewController.swift
//  EPex_Mobile_2
//
//  Created by Apple on 6/14/17.
//  Copyright © 2017 GeneralElectric. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var ownerNameLabel: UITextField!
    @IBOutlet var projectIDLabel: UITextField!
   
    @IBAction func buttonSearch(_ sender: Any) {
            //perform search:
       // let ownerName = ownerNameLabel.text
       // let projectID = projectIDLabel.text
       // let productLine = productLineLabel.text
        
        //clear text fields after search:
        ownerNameLabel.text = ""
        projectIDLabel.text = ""
    //    productLineLabel.text = ""
        
        [self.performSegue(withIdentifier: "mySearchSegue", sender: self)]

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
       //keyboard(hit "Return"):
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }

}
