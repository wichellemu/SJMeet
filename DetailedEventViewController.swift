//
//  DetailedEventViewController.swift
//  SJMeet
//
//  Created by Aaron Chuang on 10/4/14.
//  Copyright (c) 2014 Michelle Wu. All rights reserved.
//

import Foundation

class DetailedEventViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var endTime: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var eventID = "";
    
    @IBAction func backTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // If user taps camera, allow photo to be taken
    @IBAction func cameraTapped(sender: AnyObject) {
        // If there is a camera
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            var image = UIImagePickerController()
            image.delegate = self
            image.sourceType = UIImagePickerControllerSourceType.Camera
            
            // Allow user to take a picture
            self.presentViewController(image, animated: true, completion: nil)
        }
        
    }
    
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!) {
        // Access uncropped image from info dictionary
        let image = info[UIImagePickerControllerOriginalImage] as UIImage
        
        // Dismiss controller
        picker.dismissViewControllerAnimated(true, completion: nil)
        
        // Upload image
        var imageData: NSData = UIImageJPEGRepresentation(image, 0.9)
        // Convert NSData Object to PFFile
        var imageFile:PFFile = PFFile(data: imageData);
        
        // Grab the event and set the image
        var query = PFQuery(className:"Event")
        query.whereKey("objectId", equalTo: eventID)
        var event = query.getFirstObject()
        
        var photo = PFObject(className: "Photos")
        photo.setObject(imageFile, forKey: "photo")
        photo.setObject(event, forKey: "event")
        photo.saveInBackgroundWithBlock {
            (success: Bool!, error: NSError!) -> Void in
            if (success != nil) {
                NSLog("Photo saved!")
            } else {
                NSLog("%@", error)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var query2 = PFQuery(className: "Event");
        query2.whereKey("objectId", equalTo: eventID)
        var event = query2.getFirstObject()
        
        var query = PFQuery(className: "Photos");
        query.whereKey("event", equalTo: event);
        var photos = query.findObjects();
        
        eventName.text = event.objectForKey("name") as? String
        locationName.text = event.objectForKey("eventVenue") as? String
        // startTime.text = event.objectForKey("startDate") as? String
        // endTime.text = event.objectForKey("endDate") as? String
        descriptionLabel.text = event.objectForKey("description") as? String
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
