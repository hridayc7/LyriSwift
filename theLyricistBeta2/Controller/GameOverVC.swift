//
//  gameOverViewController.swift
//  theLyricistBeta2
//
//  Created by Hriday Chhabria on 1/15/21.
//  Copyright © 2021 Hriday Chhabria. All rights reserved.

//This class mamnages all the UI Elements for thhe game over page
import UIKit

class gameOverViewController: UIViewController {

    @IBOutlet weak var home: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var newHighScore = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
        scoreLabel.text = "Score: \(DataTransfer2.score)"
        Utilities.styleFilledButton(home)
        if(newHighScore){
            print("New High Score")
        }
    }
    
    
    
    


}
