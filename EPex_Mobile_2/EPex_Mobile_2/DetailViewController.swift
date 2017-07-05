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
    
   // var tasksArr = ["Add Buttons", "Fix Display", "Read Data From Database"]
    var tasksArr = ["TG0", "TG1", "TG3", "TG6", "PCB", "TG9", "CID"]
    
    var commitDates:[String] = ["06/29/2017", "10/26/2017", "01/13/2017", "06/29/2017", "06/29/2017", "06/29/2017", "06/29/2017"]
    var actualDates:[String] = ["__/__/____", "__/__/____", "__/__/____", "__/__/____", "__/__/____", "__/__/____", "__/__/____"]
    
    
    
    @IBAction func buttonSave(_ sender: Any) {
        if selectedRow >= 0 {
            let savedDate_Date = datePicker.date
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let savedDate_String = dateFormatter.string(from:savedDate_Date as Date)
            
            actualDates[selectedRow] = savedDate_String
            table2.reloadData()
            
            //return to current date:
            datePicker.date = Date()
            
            selectedRow = -1
        }
    }
    
    @IBAction func buttonRemoveTask(_ sender: Any) {
        if selectedRow >= 0 && actualDates[selectedRow] != "__/__/____" {
            //set task completion date!!!
            
            //remove task
            tasksArr.remove(at: selectedRow)
            commitDates.remove(at: selectedRow)
            actualDates.remove(at: selectedRow)
            table2.reloadData()
            
            //return to current date:
            datePicker.date = Date()
            
            selectedRow = -1
        }

    }
 /*   @IBAction func buttonHome(_ sender: Any) {
        performSegue(withIdentifier: "segueToSplashScreenVCFromDetailVC", sender: self)
    }
 */
    
    var selectedRow = -1
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tasksArr.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell2 = tableView.dequeueReusableCell(
            withIdentifier: "Project_Cell2",
            for: indexPath) as! DetailVCTableViewCell
        
        let row = indexPath.row
            cell2.taskNameLabel?.text = tasksArr[row]
            cell2.commitDateLabel?.text = commitDates[row]
            cell2.actualDateLabel?.text = actualDates[row]
        
        return cell2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        projectNameLabel.text = UserDefaults.standard.object(forKey: "projectName") as? String
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //set max date on date picker today!:
        datePicker.maximumDate = Date()
        
        //Project Name (Title Label):
        projectNameLabel.text = UserDefaults.standard.object(forKey: "projectName") as? String
        
        table2.reloadData()
        
        //saving commit dates to test notifications:
           UserDefaults.standard.set(commitDates, forKey: "commitDates_StringArr")
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
