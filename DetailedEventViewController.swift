//
//  DetailedEventViewController.swift
//  SJMeet
//
//  Created by Aaron Chuang on 10/4/14.
//  Copyright (c) 2014 Michelle Wu. All rights reserved.
//

import Foundation

class DetailedEventViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var eventID = "";
    
    @IBAction func backTapped(sender: AnyObject) {
      /*  var eventVC = EventViewController(nibName: "EventViewController", bundle: nil)
        self.presentViewController(eventVC, animated: true, completion: nil)*/
        
        /* var myStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var eventVC: EventViewController = myStoryboard.instantiateViewControllerWithIdentifier("EventVC") as EventViewController
        self.navigationController?.pushViewController(eventVC, animated: true) */
        
     //  let eventVC:EventViewController = self.storyboard.instantiateViewControllerWithIdentifier("EventVC")
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
       // self.navigationController!.pushViewController(eventVC, animated: true)
        
       /* UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
        UIViewController *initViewController = [storyBoard instantiateInitialViewController];
        [self.window setRootViewController:initViewController];*/
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
    
    
    /* - (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
    {
    // Access the uncropped image from info dictionary
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    // Dismiss controller
    [picker dismissModalViewControllerAnimated:YES];
    
    // Resize image
    UIGraphicsBeginImageContext(CGSizeMake(640, 960));
    [image drawInRect: CGRectMake(0, 0, 640, 960)];
    UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Upload image
    NSData *imageData = UIImageJPEGRepresentation(image, 0.05f);
    [self uploadImage:imageData];
    } */
    
    
    
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
        
        
        
        // let selectedImage : UIImage = image
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
