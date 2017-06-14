//
//  DetailViewController.swift
//  EPex Mobile
//
//  Created by Apple on 6/13/17.
//  Copyright © 2017 UdemyCourse. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table2: UITableView!
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
        
        table2.reloadData()
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
