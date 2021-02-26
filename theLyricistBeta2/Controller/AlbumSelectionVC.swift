//
//  homeViewController.swift
//  theLyricistBeta2
//
//  Created by Hriday Chhabria on 7/20/20.
//  Copyright © 2020 Hriday Chhabria. All rights reserved.
//

import UIKit

class albumSelectionViewController: UIViewController {

    @IBOutlet weak var tSwift: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false

        // Do any additional setup after loading the view.
    }
    
    @IBAction func albumTapped(_ sender: UIButton) {
        DataTransfer1.getSongList(albumName: (sender.titleLabel?.text)!)
        print((sender.titleLabel?.text)!)
    }
    
    @IBAction func unwindToAlbumVC(_sender: UIStoryboardSegue){}
    

}
