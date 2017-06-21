//
//  SearchViewController.swift
//  EPex_Mobile_2
//
//  Created by Apple on 6/14/17.
//  Copyright © 2017 GeneralElectric. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var picker: UIPickerView!

    @IBOutlet var ownerNameTextField: UITextField!
    @IBOutlet var projectIDTextField: UITextField!
   
    @IBAction func buttonHome2(_ sender: Any) {
         performSegue(withIdentifier: "segueToSplashScreenVCFromSearchVC", sender: self)
    }
    @IBAction func buttonSearch(_ sender: Any) {
            //perform search:
       // let ownerName = ownerNameLabel.text
       // let projectID = projectIDLabel.text
       // let productLine = productLineLabel.text
        
        //clear text fields after search:
        ownerNameTextField.text = ""
        projectIDTextField.text = ""
    //    productLineLabel.text = ""
        
     //   [self.performSegue(withIdentifier: "mySearchSegue", sender: self)]

         performSegue(withIdentifier: "mySearchSegue", sender: self)
       
   //     [self presentViewController:myViewController animated:YES completion:nil];
    }
    
         //these are the Product Line options from EPex
    let pickerData: [String] = ["Advanced Combat Engine", "AVS", "CF34", "CF6", "CFE738", "CFM56", "CJ-CF", "CT58", "CT64", "CT7", "DES", "DSS", "ETCoE", "F101", "F108", "F110", "F118", "F404", "GE3000", "GE38", "GE90", "GE93", "GE9X", "GEnx", "GP", "HF120", "IT Support", "J79", "J85", "LEAP", "M&I", "Not Applicable", "Passport 20", "SEI", "Supply Chain-Systems", "T58", "T64", "T700", "Technology", "TF34", "TF39", "YT706"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Connect data: **would be the code way of doing it (but i did it by using CTRL-drag!)
       // self.picker.delegate = self
       // self.picker.dataSource = self
 
        //set default starting point for picker view:
        picker.selectRow(4, inComponent: 0, animated: true)
        
        //for number pad's done button:
        self.addDoneButtonOnKeyboard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //keyboards 1 and 2 (touch outside of keyboard):
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //keyboard 1 (hit "Return"):
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.projectIDTextField.becomeFirstResponder()
        return true
    }
    
    //keyboards 1 and 2 (create "Next" and "Done" buttons!):
    func addDoneButtonOnKeyboard() {
        //next button:
        let nextToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        nextToolbar.barStyle = UIBarStyle.default
        
        let flexSpace1 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let next: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(SearchViewController.nextButtonAction))
        //^^this was actually just changed to a "Done" button while return was changed to "Next"!!
        
        var items1 = [UIBarButtonItem]()
        items1.append(flexSpace1)
        items1.append(next)
        
        nextToolbar.items = items1
        nextToolbar.sizeToFit()
        
        self.ownerNameTextField.inputAccessoryView = nextToolbar
        
        
        //done button:
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle = UIBarStyle.default
        
        let flexSpace2 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(SearchViewController.doneButtonAction))
        
        var items2 = [UIBarButtonItem]()
        items2.append(flexSpace2)
        items2.append(done)
        
        doneToolbar.items = items2
        doneToolbar.sizeToFit()
        
        self.projectIDTextField.inputAccessoryView = doneToolbar
    }
    
    
    func doneButtonAction() {
        self.projectIDTextField.resignFirstResponder()
    }
    
    func nextButtonAction() {
        self.ownerNameTextField.resignFirstResponder()
      //  self.projectIDTextField.becomeFirstResponder()
    }
    
    //picker view:
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(pickerData[row])
    }
    
    
    
     @IBAction func unwindToSearchVC(segue: UIStoryboardSegue) {}

}
