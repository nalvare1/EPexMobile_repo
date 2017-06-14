//
//  SearchResultsViewController.swift
//  EPex_Mobile_2
//
//  Created by Apple on 6/14/17.
//  Copyright © 2017 GeneralElectric. All rights reserved.
//

import UIKit

class SearchResultsViewController:  UIViewController, UITableViewDelegate, UITextFieldDelegate {
    
    @IBAction func buttonSearchAgain(_ sender: Any) {
        performSegue(withIdentifier: "segueToSearchVC", sender: self)
    }
    @IBOutlet var table3: UITableView!
   
    
    let cellContent3:[String] = ["Natalie", "Anthony", "David"]
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return cellContent3.count
    }
    
    @nonobjc internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell3 = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Search_Results_Cell")
        
        cell3.textLabel?.font = UIFont(name: "GE Inspira", size: 16)
    
        cell3.textLabel?.text = cellContent3[indexPath.row]
    
        return cell3
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
