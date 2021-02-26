//
//  ManagerDefaults.swift
//  theLyricistBeta2
//
//  Created by Hriday Chhabria on 1/18/21.
//  Copyright © 2021 Hriday Chhabria. All rights reserved.
//


//This is a Defaults manger class. It is used to build on extensions from the UserDefaults module in Swift 5. This is used in heling track user information, i.e score, name etc.
import Foundation
import UIKit

let defaults = UserDefaults()

struct Keys {
    static let firstName = "firstName"
    static let lastName = "lastName"
    static let profilePhoto = "Picture"
    static let highScore = "highScore"
    static let appOpenedCount = "aoc"
}





