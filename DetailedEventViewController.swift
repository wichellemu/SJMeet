//
//  DetailedEventViewController.swift
//  SJMeet
//
//  Created by Aaron Chuang on 10/4/14.
//  Copyright (c) 2014 Michelle Wu. All rights reserved.
//

import Foundation

class DetailedEventViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate /*, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout */ {
    
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var endTime: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    
    // @IBOutlet weak var photoGallery: UICollectionView!
    
    // var collectionView: UICollectionView?
    var eventID = "";
    var arrayOfPics: [UIImage] = []

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
    
    /* func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfPics.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as UICollectionViewCell
        
        // [cell.galleryImage setImage:[UIImage imageWithContentsOfFile:[imageArray objectAtIndex:indexPath.row]]];
        
        // cell.contentView.image = arrayOfPics[forIndexPath: indexPath]
        
        // cell.backgroundColor = UIColor.orangeColor()

        
        cell.contentView.backgroundColor = UIColor(patternImage: arrayOfPics[indexPath.row])
        
        return cell
    } */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var query2 = PFQuery(className: "Event");
        query2.whereKey("objectId", equalTo: eventID)
        var event = query2.getFirstObject()
        
        var query = PFQuery(className: "Photos");
        query.whereKey("event", equalTo: event);
        var photos = query.findObjects();
        var obj: PFObject
        for obj in photos {
            var imageFile: PFFile? = obj.objectForKey("photo") as? PFFile
            var data: NSData = imageFile!.getData()
            var image: UIImage = UIImage(data: data)
            arrayOfPics.append(image)
        }
        
        eventName.text = event.objectForKey("name") as? String
        locationName.text = event.objectForKey("eventVenue") as? String
        descriptionLabel.text = event.objectForKey("description") as? String
        
        // startTime.text = event.objectForKey("startDate") as? String
        // endTime.text = event.objectForKey("endDate") as? String
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EEE MMM dd 'at' hh:mm a"
        // dateFormatter.dateFormat = "yyyy-MM-dd 'at' h:mm a"
        var start = dateFormatter.stringFromDate(event.objectForKey("startDate") as NSDate)
        var end = dateFormatter.stringFromDate(event.objectForKey("endDate") as NSDate)
        startTime.text = "Starts at " + start;
        endTime.text = "Ends at " + end;
        
        // Cheap fix
        if(arrayOfPics.count >= 1) {
            image1.image = arrayOfPics[0];
        }
        
        if(arrayOfPics.count >= 2) {
            image2.image = arrayOfPics[1];
        }
        
        if(arrayOfPics.count >= 3) {
            image3.image = arrayOfPics[2];
        }
        
        if(arrayOfPics.count >= 4) {
            image4.image = arrayOfPics[3];
        }
        
        if(arrayOfPics.count >= 5) {
            image5.image = arrayOfPics[4];
        }
        
        if(arrayOfPics.count >= 6) {
            image6.image = arrayOfPics[5];
        }
        
        /* photoGallery!.dataSource = self
        photoGallery!.delegate = self
        
        photoGallery!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        photoGallery!.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(photoGallery!) */
        /* let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 200, height: 300)
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView!.dataSource = self
        collectionView!.delegate = self
        collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView!.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(collectionView!) */
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
