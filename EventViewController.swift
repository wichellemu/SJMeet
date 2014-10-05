//
//  EventViewController.swift
//  SJMeet
//
//  Created by Aaron Chuang on 10/4/14.
//  Copyright (c) 2014 Michelle Wu. All rights reserved.
//

import Foundation

class EventViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var eventsTable: UITableView!
    
    var events = [AnyObject]()
    var numEvents = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register the UITableViewCell class with the tableView
        
        // self.tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
        
        // Setup table data
        var query = PFQuery(className: "Event")
        events = query.findObjects()
        numEvents = events.count
        
        /* var query = PFQuery(className:"Event")
        query.findObjectsInBackgroundWithBlock {
        (results: [AnyObject]!, error: NSError!) -> Void in
        if error == nil {
        self.events = results
        self.numEvents = results.count
        }
        } */
        
        // self.pullToRefreshEnabled = YES;
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UITableViewDataSource methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // println(events.count)
        return events.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("EventCell") as? UITableViewCell
        
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "EventCell")
        }
        
        // println((events[indexPath.row]).objectForKey("name") as? String)
        cell!.textLabel?.text = (events[indexPath.row]).objectForKey("name") as? String
        // println(cell.textLabel?.text)
        
        return cell!
    }
    
    // UITableViewDelegate methods
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        var detailedEventVC = DetailedEventViewController(nibName: "DetailedEventViewController", bundle: nil)
        detailedEventVC.eventID = events[indexPath.row].objectId
        self.presentViewController(detailedEventVC, animated: true, completion: nil)
        
        /* let alert = UIAlertController(title: "Item selected", message: "You selected item \(indexPath.row)", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK",
            style: UIAlertActionStyle.Default,
            handler: {
                (alert: UIAlertAction!) in println("An alert of type \(alert.style.hashValue) was tapped!")
        }))
        
        self.presentViewController(alert, animated: true, completion: nil) */
        
    }
    
}