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
    
    @IBOutlet weak var radiusSlider: UISlider!
    @IBOutlet weak var radiusValLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
        
        return title
    }
    
    @IBAction func sliderValueChanged(sender: AnyObject) {
        var radiusVal = self.radiusSlider.value
        radiusValLabel.text = String(format:"%.1f", radiusVal)
    }


}