//
//  ProfileViewController.swift
//  theLyricistBeta2
//
//  Created by Hriday Chhabria on 1/13/21.
//  Copyright © 2021 Hriday Chhabria. All rights reserved.
//

//This file manages UI elements on the user's profile page

import UIKit

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profilePictureImageView: UIImageView!
    
    @IBOutlet weak var hsLabel: UILabel!
    @IBOutlet weak var bestAlbumLabel: UILabel!
    
    
    
    let defaults = UserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.profilePictureImageView.layer.masksToBounds = true
        self.profilePictureImageView.layer.cornerRadius = profilePictureImageView.bounds.width / 2;
        
        
        self.navigationController?.navigationBar.isHidden = false
        self.userNameLabel.text = gamePlayer.userName + " " + gamePlayer.lastName
        
        if(defaults.integer(forKey: Keys.highScore) != 0){
            hsLabel.text = "Highscore: \(defaults.integer(forKey: Keys.highScore))"
            bestAlbumLabel.text = "Best Album: \(defaults.string(forKey: "album")!)"
        }
            
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("hello")
    }
    
    @IBAction func unwindToProfilePage(_sender: UIStoryboardSegue){}
    
    @IBAction func chooseImage(_ sender: Any) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        let actionSheet = UIAlertController(title: "Profile Picture", message: "Select a new Image", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action:UIAlertAction) in
            
        }))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        profilePictureImageView.image = image
        
        let imageData = UIImage.pngData(image)
        print(imageData)
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
