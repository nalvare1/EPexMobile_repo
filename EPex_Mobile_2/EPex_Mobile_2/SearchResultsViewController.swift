//
//  SearchResultsViewController.swift
//  EPex_Mobile_2
//
//  Created by Apple on 6/14/17.
//  Copyright © 2017 GeneralElectric. All rights reserved.
//

import UIKit

class SearchResultsViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource {
    var selectedRow = -1
    
    var projectNames:[String] = ["Make An App", "Figure out Search Results", "Do Something Else"]
    var projectOwners:[String] = ["1234", "5678", "9111"]
    
    
    @IBOutlet var Label2: UILabel!
    
    @IBOutlet var table3: UITableView!
    @IBAction func buttonSearchAgain(_ sender: Any) {
        performSegue(withIdentifier: "segueToSearchVC", sender: self)
    }
    
    @IBAction func buttonSave(_ sender: Any) {
        //!!SAVE THIS INFO SOMEHOW INTO SAVED PROJECTS BEFORE DELETION!!!
        
        if selectedRow >= 0 {
        
            //delete row (prob from arrays) after saving:
            projectNames.remove(at: selectedRow)
            projectOwners.remove(at: selectedRow)
        
            //update table:
            table3.reloadData()
            
            selectedRow = -1
        }
        
    }
    
    @IBAction func buttonHome(_ sender: Any) {
         performSegue(withIdentifier: "segueToSplashScreenVCFromSearchResultsVC", sender: self)
    }
    
    //let cellContent3:[String] = ["Natalie", "Anthony", "David"]
    
    
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
        cell3.ownerNameLabel?.text = projectOwners[row]
        cell3.ownerName2Label?.text = ""

        
     //   cell3.textLabel?.font = UIFont(name: "GE Inspira", size: 16)
    
      //  cell3.textLabel?.text = cellContent3[indexPath.row]
    
        return cell3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 50; //Choose your custom row height
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
        
        table3.reloadData()
    }
    
    var searchArr: [String] = []

    override func viewDidAppear(_ animated: Bool) {
        table3.reloadData()
        
     /*   let searchObject = UserDefaults.standard.object(forKey: "searchArr") as? [String]
        
        print(searchObject ?? "Error in getting user data")
        
        if let tempArr = searchObject {
            searchArr = tempArr
            
            Label2.text = "Owner Name: " + searchArr[0] + "\n" + "Project ID: " + searchArr[1] + "\n" + "Product Line: " + searchArr[2] + "\n"
            
             print(searchArr)
        }
    */
         Label2.text = "Owner Name: " + searchArr[0] + "\n" + "Project ID: " + searchArr[1] + "\n" + "Product Line: " + searchArr[2]
        
        print(searchArr)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //set global var to indexPath.row value:
        selectedRow = indexPath.row
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
