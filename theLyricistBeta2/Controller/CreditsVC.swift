//
//  creditsViewController.swift
//  theLyricistBeta2
//
//  Created by Hriday Chhabria on 1/15/21.
//  Copyright © 2021 Hriday Chhabria. All rights reserved.

//This class mamnages all the UI Elements for thhe credits page

import UIKit

class creditsViewController: UIViewController {

    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var songSourceLabel: UILabel!
    @IBOutlet weak var songWritersLabel: UILabel!
    @IBOutlet weak var copyWrightLabel: UILabel!
    
    var currentSong: Song? = nil
    
    //This entire file manages all the credits and copyright details
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.songTitleLabel.text = currentSong?.songTitle
        self.songSourceLabel.text = (currentSong?.source)!
        self.songWritersLabel.text = (currentSong?.songWriters)!
        self.copyWrightLabel.text = "Copyrights: \((currentSong?.copyRights)!)"
        
    
    }

}
