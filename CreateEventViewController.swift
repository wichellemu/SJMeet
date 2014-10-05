//
//  CreateEventViewController.swift
//  SJMeet
//
//  Created by Aaron Chuang on 10/4/14.
//  Copyright (c) 2014 Michelle Wu. All rights reserved.
//

import Foundation
import UIKit

class CreateEventController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    @IBOutlet weak var titleTextbox: UITextField!
    @IBOutlet weak var locationTextbox: UITextField!
    @IBOutlet weak var descriptionTextbox: UITextView!
    @IBOutlet weak var createButton: UIButton!
    
    
    @IBOutlet weak var startTimePicker: UIDatePicker!
    
    @IBOutlet weak var endTimePicker: UIDatePicker!
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
                    // Then you need to redirect them to event page
                    var detailedEventVC = DetailedEventViewController(nibName: "DetailedEventViewController", bundle: nil)
                    detailedEventVC.eventID = event.objectId
                    self.presentViewController(detailedEventVC, animated: true, completion: nil)
                } else {
                    NSLog("%@", error)
                }
            }
        }
    }
    
    /* Keyboard disappears after pressing "Done" */
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        textView.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextbox.delegate = self
        locationTextbox.delegate = self
        descriptionTextbox.delegate = self
        
        var tapper = UITapGestureRecognizer(target: self, action:Selector("handleSingleTap:"))
        
        tapper.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapper)
    }
    
    func handleSingleTap(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}