//
//  HomePageViewController.swift
//  theLyricistBeta2
//
//  Created by Hriday Chhabria on 1/13/21.
//  Copyright © 2021 Hriday Chhabria. All rights reserved.

//This entire file manages ui elements on the homepage

import UIKit

class HomePageViewController: UIViewController {
    
    @IBOutlet weak var editProfileButton: UIButton!
    
    let defaults = UserDefaults()
    
    //This method is called whenn the main home screen view loads. It manages several ui elements
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.prefersLargeTitles = true
    
        
        let openedCount = defaults.integer(forKey: Keys.appOpenedCount)
        
        if(openedCount == 0){
            editProfileButton.isHidden = false
            defaults.set(1, forKey: Keys.appOpenedCount)
        }else{
            editProfileButton.isHidden = true
        }
        
    }
    
    @IBAction func createProfileTapped(_ sender: Any) {
        editProfileButton.isHidden = true
    }
    
    
    @IBAction func unwindToHomeVC(_sender: UIStoryboardSegue){}
    
}
