//
//  CreateEventViewController.swift
//  SJMeet
//
//  Created by Aaron Chuang on 10/4/14.
//  Copyright (c) 2014 Michelle Wu. All rights reserved.
//

import Foundation

class CreateEventController: UIViewController {
    @IBOutlet weak var titleTextbox: UITextField!
    @IBOutlet weak var locationTextbox: UITextField!
    @IBOutlet weak var descriptionTextbox: UITextField!
    @IBOutlet weak var createButton: UIButton!
    
    @IBAction func buttonClicked(sender: AnyObject) {
        println("Button was clicked", sender)
        
        var title = titleTextbox.text
        var location = locationTextbox.text
        var description = descriptionTextbox.text
        
        // If information not all filled out
        if(title == "" || location == "" || description == "") {
            let alert = UIAlertController(title: "Error", message: "Please fill out all the required information.", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK",
                style: UIAlertActionStyle.Default,
                handler: {
                    (alert: UIAlertAction!) in println("An alert of type \(alert.style.hashValue) was tapped!")
            }))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        // If information filled out, create event
        else {
            var event = PFObject(className: "Event")
            event.setObject(title, forKey: "name")
            event.setObject(location, forKey: "eventVenue")
            event.setObject(description, forKey: "description")
            event.saveInBackgroundWithBlock {
                (success: Bool!, error: NSError!) -> Void in
                if (success != nil) {
                    NSLog("Object created!")
                } else {
                    NSLog("%@", error)
                }
            }
            // Then you need to redirect them to event page
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
