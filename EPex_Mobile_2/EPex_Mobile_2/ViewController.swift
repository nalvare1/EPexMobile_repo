//
//  ViewController.swift
//  EPex Mobile
//
//  Created by Apple on 6/13/17.
//  Copyright © 2017 UdemyCourse. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!

    @IBAction func buttonHome(_ sender: Any) {
           performSegue(withIdentifier: "segueToSplashScreenVCFromSavedProjectsVC", sender: self)
    }
    
    var selectedRow = 0
  //  let cellContent:[String] = ["Natalie", "Anthony", "David"]
    
    let projectNames:[String] = ["Make An App", "Figure out Search Results", "Do Something Else"]
    let projectOwners:[String] = ["1234", "5678", "9111"]
    

    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return projectNames.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //  let cell3 = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Search_Results_Cell")
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "Saved_Projects_Cell",
            for: indexPath) as! SearchResultsTableViewCell
        
        let row = indexPath.row
        cell.projectNameLabel?.text = projectNames[row]
        cell.ownerName2Label?.text = projectOwners[row]
        cell.ownerNameLabel?.text = ""

        
        //   cell.textLabel?.font = UIFont(name: "GE Inspira", size: 16)
        
        //  cell.textLabel?.text = cellContent[indexPath.row]
        
        return cell
    }
    
    var commitDates_DateType: [Date] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 50; //Choose your custom row height
    }
    
     override func viewDidAppear(_ animated: Bool) {
        table.reloadData()
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //set global var:
        selectedRow = indexPath.row
        
        UserDefaults.standard.set(projectNames[selectedRow], forKey: "projectName")
       
     //   tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        
        //go to DetailVC:
        performSegue(withIdentifier: "mySegue", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToSavedProjectsVC(segue: UIStoryboardSegue) {}
}

