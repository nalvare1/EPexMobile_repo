//
//  DetailViewController.swift
//  EPex Mobile
//
//  Created by Apple on 6/13/17.
//  Copyright © 2017 UdemyCourse. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var taskNumberTextField: UITextField!
    @IBOutlet var monthTextField: UITextField!
    @IBOutlet var dateTextField: UITextField!
    @IBOutlet var yearTextField: UITextField!
    @IBOutlet var textSavedInfo: UILabel!
    @IBAction func buttonSave(_ sender: Any) {
        let MM = monthTextField.text
        let DD = dateTextField.text
        let YY = yearTextField.text
        let TN = taskNumberTextField.text
        textSavedInfo.text = "Task " + TN! + ": " + MM! + "/" + DD! + "/" + YY! + " was saved"
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UIDatePicker  *dp = [[UIDatePicker alloc]initWithFrame:CGRectZero];
        // userDateField.inputView = dp;
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

 
}
