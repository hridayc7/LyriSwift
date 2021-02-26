//
//  ProfileEditorViewController.swift
//  theLyricistBeta2
//
//  Created by Hriday Chhabria on 1/13/21.
//  Copyright © 2021 Hriday Chhabria. All rights reserved.
//

//This Manages UI Elements on the Profile editor page

import UIKit

class ProfileEditorViewController: UIViewController {
    
    let defaults = UserDefaults()
    
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func firstNameFieldEdited(_ sender: Any) {
        gamePlayer.userName = self.firstNameField.text!
        defaults.set(self.firstNameField.text!, forKey: Keys.firstName)
        
    }
    @IBAction func lastNameFieldEdited(_ sender: Any) {
        gamePlayer.lastName = self.lastNameField.text!
        defaults.set(self.lastNameField.text!, forKey: Keys.lastName)
    }
    
    
    
    
}
