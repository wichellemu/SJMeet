//
//  MainMenuViewController.swift
//  SJMeet
//
//  Created by Michelle Wu on 10/4/14.
//  Copyright (c) 2014 Michelle Wu. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    @IBOutlet weak var mapBackground: UIImageView!

    @IBOutlet weak var interestsBtn: UIButton!
    @IBOutlet weak var eventsBtn: UIButton!
    @IBOutlet weak var interactiveMapBtn: UIButton!
    @IBOutlet weak var settingsBtn: UIButton!
    
    @IBAction func settingsTapped(sender: AnyObject) {
        
    }
    
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

}

