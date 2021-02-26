//
//  userInformationClass.swift
//  theLyricistBeta2
//
//  Created by Hriday Chhabria on 1/18/21.
//  Copyright © 2021 Hriday Chhabria. All rights reserved.
//


//This is a gamePlayer class. It is used to keeptrack of all of the user information i.e. first name last name etc.
import Foundation
import UIKit

class gamePlayer{
    static var highScore = 0;
    static var userName = "Olivia"
    static var lastName = "Benson"
    
    static func changeNamme(firstName: String, lastName: String){
        self.userName = firstName
        self.lastName = lastName
    }
}


