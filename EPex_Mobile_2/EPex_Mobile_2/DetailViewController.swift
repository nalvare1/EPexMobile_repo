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
        
        //reset project name:
        UserDefaults.standard.set(" ", forKey: "projectName")
        projectNameLabel.text = " "
    }
    
    @IBOutlet var projectNameLabel: UILabel!
    @IBOutlet var table2: UITableView!
    @IBOutlet var datePicker: UIDatePicker!
    
    var tasksArr = [String]()
    
    @IBAction func buttonSave(_ sender: Any) {
        if selectedRow >= 0 {
            //set task completion date!!!
        
            //remove task
            tasksArr.remove(at: selectedRow)
            table2.reloadData()
        
            //return to current date:
            datePicker.date = Date()
            
            selectedRow = -1
        }

    }
    
    @IBAction func buttonHome(_ sender: Any) {
        performSegue(withIdentifier: "segueToSplashScreenVCFromDetailVC", sender: self)
    }
    
    var selectedRow = -1
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tasksArr.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell2 = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Project_Cell2")
        
         cell2.textLabel?.font = UIFont(name: "GE Inspira", size: 16)
        
        cell2.textLabel?.text = tasksArr[indexPath.row]
        
        return cell2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasksArr = ["Add Buttons", "Fix Display", "Read Data From Database"]
        
        projectNameLabel.text = UserDefaults.standard.object(forKey: "projectName") as? String
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //set max date on date picker today!:
        datePicker.maximumDate = Date()
        
        //Project Name (Title Label):
        projectNameLabel.text = UserDefaults.standard.object(forKey: "projectName") as? String
        
        table2.reloadData()
    }

     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //set global var:
        selectedRow = indexPath.row
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
