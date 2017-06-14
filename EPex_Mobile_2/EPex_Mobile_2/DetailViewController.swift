//
//  DetailViewController.swift
//  EPex Mobile
//
//  Created by Apple on 6/13/17.
//  Copyright © 2017 UdemyCourse. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    @IBAction func buttonBackToProjects(_ sender: Any) {
        performSegue(withIdentifier: "segueToSavedProjectsVC", sender: self)
    }
    
    @IBOutlet var table2: UITableView!
    @IBOutlet var datePicker: UIDatePicker!
    
    @IBAction func buttonSave(_ sender: Any) {
        
    }
    let cellContent2 = ["Natalie", "Anthony", "David"]
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cellContent2.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell2 = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Project_Cell2")
        
         cell2.textLabel?.font = UIFont(name: "GE Inspira", size: 16)
        
        cell2.textLabel?.text = cellContent2[indexPath.row]
        
        return cell2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        table2.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
       //set max date on date picker today!:
        datePicker.maximumDate = Date()
        table2.reloadData()
    }

    //keyboard touch:
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //is run whenever the user touches the main area of the app (aka anything outside of the keyboard!)
        
        //closes keyboard when tapping outside of keyboard:
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//**Don't forget to CTRL-drag from text field to View Controller (in Main Storyboard) and select "delegate"!!!
