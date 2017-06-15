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
  //  let cellContent:[String] = ["Natalie", "Anthony", "David"]
    
    let projectNames:[String] = ["Make An App", "Figure out Search Results", "Do Something Else"]
    let projectOwners:[String] = ["Natalie", "Anthony", "David"]
    let commitDates:[String] = ["09/06/17", "10/26/17", "01/13/17"]
    let actualDates:[String] = ["09/06/96", "10/26/98", "01/13/99"]
    

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
        cell.ownerLabel?.text = projectOwners[row]
        cell.commitDateLabel?.text = commitDates[row]
        cell.actualDateLabel?.text = actualDates[row]
        
        //   cell.textLabel?.font = UIFont(name: "GE Inspira", size: 16)
        
        //  cell.textLabel?.text = cellContent[indexPath.row]
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 75; //Choose your custom row height
    }
    
     override func viewDidAppear(_ animated: Bool) {
        
        table.reloadData()
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        
        let row = indexPath.row
         print(row)
        
        if row >= 0 {
            performSegue(withIdentifier: "mySegue", sender: self)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToSavedProjectsVC(segue: UIStoryboardSegue) {}
}

