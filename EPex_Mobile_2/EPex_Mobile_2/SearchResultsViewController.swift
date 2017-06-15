//
//  SearchResultsViewController.swift
//  EPex_Mobile_2
//
//  Created by Apple on 6/14/17.
//  Copyright © 2017 GeneralElectric. All rights reserved.
//

import UIKit

class SearchResultsViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBAction func buttonSearchAgain(_ sender: Any) {
        performSegue(withIdentifier: "segueToSearchVC", sender: self)
    }
    @IBAction func buttonSave(_ sender: Any) {
    

       //delete row (prob from array) after saving
    }
    
    @IBOutlet var table3: UITableView!
   
    
    //let cellContent3:[String] = ["Natalie", "Anthony", "David"]
    
    let projectNames:[String] = ["Make An App", "Figure out Search Results", "Do Something Else"]
    let projectOwners:[String] = ["Natalie", "Anthony", "David"]
    let commitDates:[String] = ["09/06/17", "10/26/17", "01/13/17"]
    let actualDates:[String] = ["09/06/96", "10/26/98", "01/13/99"]
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return projectNames.count
    }
 
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
      //  let cell3 = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Search_Results_Cell")
    
        let cell3 = tableView.dequeueReusableCell(
            withIdentifier: "Search_Results_Cell",
            for: indexPath) as! SearchResultsTableViewCell
        
        let row = indexPath.row
        cell3.projectNameLabel?.text = projectNames[row]
        cell3.ownerLabel?.text = projectOwners[row]
        cell3.commitDateLabel?.text = commitDates[row]
        cell3.actualDateLabel?.text = actualDates[row]
        
     //   cell3.textLabel?.font = UIFont(name: "GE Inspira", size: 16)
    
      //  cell3.textLabel?.text = cellContent3[indexPath.row]
    
        return cell3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 75; //Choose your custom row height
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
        table3.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        table3.reloadData()
    }
    
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
