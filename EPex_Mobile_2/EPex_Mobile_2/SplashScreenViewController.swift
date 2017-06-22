//
//  SplashScreenViewController.swift
//  EPex Mobile
//
//  Created by Apple on 6/13/17.
//  Copyright © 2017 UdemyCourse. All rights reserved.
//

import UIKit
import UserNotifications

class SplashScreenViewController: UIViewController {

    @IBOutlet var EPexLabel: UILabel!
    var timer: Timer!
    
    
    var commitDates_StringArr: [String] = []
    var commitDates_DateArr: [Date] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        while commitDates_StringArr.count != 0 {
            commitDates_StringArr.remove(at: 0)
        }
        while commitDates_DateArr.count != 0 {
            commitDates_DateArr.remove(at: 0)
        }
        
        
        //then, do notification center stuff:
        UNUserNotificationCenter.current().requestAuthorization(options:[.alert, .badge, .sound], completionHandler: { (granted, error) in
            if granted {
                print("Notification access granted")
                
                //grab dates as a string and convert to dates:
                
                if let tempArr_String  = UserDefaults.standard.object(forKey: "commitDates_StringArr") as? [String] {
                    self.commitDates_StringArr = tempArr_String
                    
                    var i = 0
                    while i < self.commitDates_StringArr.count {
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "MM/dd/yyyy"
                        let dateObj = dateFormatter.date(from: self.commitDates_StringArr[i])
                        print(self.commitDates_StringArr[i])
                        // print("Dateobj: \(dateFormatter.string(from: dateObj!))")
                        self.commitDates_DateArr.append(dateObj!)
                        i += 1
                    }

                    //get current date:
                    let date = Date()
                    let calendar = Calendar.current
                    let year = calendar.component(.year, from: date)
                    let month = calendar.component(.month, from: date)
                    let day = calendar.component(.day, from: date)
                
                    let currentDate_String = String(month) + "/" + String(day)  + "/" + String(year)
                    print(currentDate_String)
                    let dateFormatter3 = DateFormatter()
                    dateFormatter3.dateFormat = "MM/dd/yyyy"
                    let currentDate_Date = dateFormatter3.date(from:currentDate_String)
                
                    //compare dates:
                    let NScal = NSCalendar.current
                    var j = 0
                    while j < self.commitDates_DateArr.count {
                    
                        // Replace the hour (time) of both dates with 00:00
                        let date1 = NScal.startOfDay(for: currentDate_Date!)
                        let date2 = NScal.startOfDay(for: self.commitDates_DateArr[j])
                    
                        let components = calendar.dateComponents([.day], from: date1, to: date2)
                        if let days_Int = components.day {
                            print(String(describing: days_Int))
                        
                            if(days_Int == 7) {
                                //PRINT NOTIFICATION!!!
                                self.scheduleNotification(inSeconds: 5, projectname: "Project 1", taskname: "Task 1",completion: { success in
                                    if success {
                                        print("Successfully scheduled notification")
                                    } else {
                                        print("Error scheduling notification")
                                    }
                                })
                            }
                        }
                        j += 1
                    }
                }
            } else {
                print(error?.localizedDescription ?? "Error getting notification access")
            }
        })
    }
    
    func scheduleNotification(inSeconds: TimeInterval, projectname: String, taskname: String, completion: @escaping (_ Success: Bool) -> ()) {
        let notif = UNMutableNotificationContent()
        notif.title = "General Electric Aviation"
        notif.subtitle = "Project: " + String(projectname)
        notif.body = "The task, " + String(taskname) + ", is due in one week!"
        
        let notifTrigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: false)
        
        let request = UNNotificationRequest(identifier: "myNotification", content: notif, trigger: notifTrigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler:  { error in
            if error != nil {
                print(error ?? "Error at notification request")
                completion(false)
            } else {
                completion(true)
            }
        })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func unwindToSplashScreenVC(segue: UIStoryboardSegue) {}
}
