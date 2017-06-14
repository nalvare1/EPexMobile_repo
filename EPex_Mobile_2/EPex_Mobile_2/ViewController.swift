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
           [self.performSegue(withIdentifier: "segueToSplashScreenVCFromSavedProjectsVC", sender: self)]
    }
    let cellContent:[String] = ["Natalie", "Anthony", "David"]
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cellContent.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Project_Cell")
       // let cell = tableView.dequeueReusableCell(withIdentifier: "Project_Cell", for: indexPath) as! ProjectsTableViewCell
        
        //cell.projectsNameLabel?.text = cellContent[indexPath.row]
        
        //UITableViewCell(style: ProjectsTableViewCell, reuseIdentifier: "Project_Cell")
    
       cell.textLabel?.font = UIFont(name: "GE Inspira", size: 16)
        
        cell.textLabel?.text = cellContent[indexPath.row]
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        table.reloadData()
    }
    
     override func viewDidAppear(_ animated: Bool) {
        
        table.reloadData()
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        
        let row = indexPath.row
         print(row)
        
        if row >= 0 {
            [self.performSegue(withIdentifier: "mySegue", sender: self)]
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToSavedProjectsVC(segue: UIStoryboardSegue) {}

}

