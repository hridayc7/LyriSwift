//
//  SecondProfileEditorViewController.swift
//  theLyricistBeta2
//
//  Created by Hriday Chhabria on 23/1/21.
//  Copyright © 2021 Hriday Chhabria. All rights reserved.

//This Manages UI Elements on the second profile editor page.
//

import UIKit

class SecondProfileEditorViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func fnEdited(_ sender: Any) {
        gamePlayer.userName = self.firstNameTextField.text!
        defaults.set(self.firstNameTextField.text!, forKey: Keys.firstName)
    }
    
    @IBAction func lnEdited(_ sender: Any) {
        gamePlayer.lastName = self.lastNameTextField.text!
        defaults.set(self.lastNameTextField.text!, forKey: Keys.lastName)
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        print("help 2")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ProfileViewController
        destVC.userNameLabel.text = firstNameTextField.text! + " " + lastNameTextField.text!
        print("help")
    }
    
    
    
}
