//
//  SettingsViewController.swift
//  SJMeet
//
//  Created by Michelle Wu on 10/4/14.
//  Copyright (c) 2014 Michelle Wu. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var notificationArray: NSArray! = ["Every New Event", "Every Hour", "Every 12 hours", "Every Day", "Never Notify"]
    
    // Saved values for NSUserDefaults
    var hackathons:Bool = false
    var concerts:Bool = false
    var socialJustice:Bool = false
    var sports:Bool = false
    var radiusVal:Float! = 0.0
    var notification:String!
    
    @IBOutlet weak var radiusSlider: UISlider!
    @IBOutlet weak var radiusValLabel: UILabel!
    
    @IBOutlet weak var hackathonsBtn: UIButton!
    @IBOutlet weak var socialJusticeBtn: UIButton!
    @IBOutlet weak var concertsBtn: UIButton!
    @IBOutlet weak var sportsBtn: UIButton!
    
    @IBAction func hackathonsTapped(sender: AnyObject) {
        hackathonsBtn.selected = !hackathonsBtn.selected
        hackathons = hackathonsBtn.selected
    }
    @IBAction func socialJusticeTapped(sender: AnyObject) {
        socialJusticeBtn.selected = !socialJusticeBtn.selected
        socialJustice = socialJusticeBtn.selected
    }
    @IBAction func concertsTapped(sender: AnyObject) {
        concertsBtn.selected = !concertsBtn.selected
        concerts = concertsBtn.selected
    }
    @IBAction func sportsTapped(sender: AnyObject) {
        sportsBtn.selected = !sportsBtn.selected
        sports = sportsBtn.selected
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*Button Colors*/
        if let hackBool = NSUserDefaults.standardUserDefaults().boolForKey("Hackathons") as Bool? {
            hackathonsBtn.selected = hackBool
        }
        
        if let sjBool = NSUserDefaults.standardUserDefaults().boolForKey("Social Justice") as Bool? {
            socialJusticeBtn.selected = sjBool
        }
        
        if let concertsBool = NSUserDefaults.standardUserDefaults().boolForKey("Concerts") as Bool? {
            concertsBtn.selected = concertsBool
        }
        
        if let sportsBool = NSUserDefaults.standardUserDefaults().boolForKey("Sports") as Bool? {
            sportsBtn.selected = sportsBool
        }
        
            
        hackathonsBtn.setTitleColor(UIColor.whiteColor().colorWithAlphaComponent(0.5), forState: .Normal)
        hackathonsBtn.setTitleColor(UIColor.whiteColor().colorWithAlphaComponent(1.0), forState: .Selected)
        
        
        socialJusticeBtn.setTitleColor(UIColor.whiteColor().colorWithAlphaComponent(0.5), forState: .Normal)
        socialJusticeBtn.setTitleColor(UIColor.whiteColor().colorWithAlphaComponent(1.0), forState: .Selected)
        
        
        concertsBtn.setTitleColor(UIColor.whiteColor().colorWithAlphaComponent(0.5), forState: .Normal)
        concertsBtn.setTitleColor(UIColor.whiteColor().colorWithAlphaComponent(1.0), forState: .Selected)
        sportsBtn.setTitleColor(UIColor.whiteColor().colorWithAlphaComponent(0.5), forState: .Normal)
        sportsBtn.setTitleColor(UIColor.whiteColor().colorWithAlphaComponent(1.0), forState: .Selected)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* Change status bar to white */
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    // #pragma mark - UIPickerView Methods
    
    /*-- Datasource methods --*/
    /* Returns # of 'columns' to display */
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    /* Return # of rows in each component */
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    
    /*-- Delegate methods --*/
    /* When user makes a selection in the UIPicker */
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString! {
        // Display of each picker
        let titleColor = UIColor(red:0.0, green:0.0,blue:0.0,alpha: 1.0)
        let attributes = [NSForegroundColorAttributeName: titleColor] // Make UIPicker white
        var title: NSMutableAttributedString!
        
        title = NSMutableAttributedString(string: "\(notificationArray[row])", attributes: attributes)
        notification = title.string
        return title
    }
    
    @IBAction func sliderValueChanged(sender: AnyObject) {
        radiusVal = self.radiusSlider.value
     /*   if let radius = NSUserDefaults.standardUserDefaults()?.floatForKey("Radius") {
            radiusVal = radius
        } else {
            radiusVal = self.radiusSlider.value
        }*/
        radiusValLabel.text = String(format:"%.1f", radiusVal)
    }
    
    // If user presses 'Save' butoon
    @IBAction func saveBtnTapped(sender: AnyObject) {
        // Save selected interests in NSUserDefaults
        NSUserDefaults.standardUserDefaults().setBool(hackathons, forKey: "Hackathons")
        NSUserDefaults.standardUserDefaults().setBool(socialJustice, forKey: "Social Justice")
        NSUserDefaults.standardUserDefaults().setBool(concerts, forKey: "Concerts")
        NSUserDefaults.standardUserDefaults().setBool(sports, forKey: "Sports")
        NSUserDefaults.standardUserDefaults().setObject(notification, forKey: "Notification")
        NSUserDefaults.standardUserDefaults().setFloat(radiusVal, forKey: "Radius")
    }
    
    
}