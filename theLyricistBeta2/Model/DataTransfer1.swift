//
//  DataTransfer1.swift
//  theLyricistBeta2
//
//  Created by Hriday Chhabria on 1/6/21.
//  Copyright © 2021 Hriday Chhabria. All rights reserved.
//

import Foundation
//This Data Transfer class is an abstraction that makes it easier for the main gameplay class to be played
class DataTransfer1{
    static var songNames: [String]  = [""]
    static var album: String = ""
    
    //This function takes in the albumNamem as a string andn returns a string array containing the names of the songs in the given album
    static func getSongList(albumName: String) -> [String]{
        album = albumName
        switch albumName {
            case "Reputation":
                songNames = ["Getaway_Car", "Call_It_What_You_Want", "Endgame"]
            case "Lover":
                songNames = ["I_Forgot_That_You_Existed", "Cruel_Summer", "Lover", "The_man", "The_archer", "ITHS", "MAATHBP", "Paper_Rings", "Cornelia_Street", "DBATC", "London_Boy", "False_God", "YNTCD", "Afterglow", "ME!", "INTHAF", "Daylight"]
        case "Top Taylor":
            print("hi")
            songNames = ["YNTCD", "ME!", "BB", "Lover","SIO", "IKYWT"]
            //, "LWYMMMMD", "Love_Story", "Evermore", "Blank Space"]
            case "Evermore":
                songNames = ["willow", "champagne_problems", "gold_rush", "tis", "tolerate_it", "nbnc", "happiness", "dorthea", "coney_island"]
                    //["willow", "champagne_problems", "gold_rush", "tis", "tolerate It", "nbnc", "happiness", "dorthea", "coneyIsland", "ivy", "cowboy", "lss", "marjorie", "closure", "evermore", "right", "timetogo"]
            default:
                songNames = [""]
        }
        songNames.shuffle()
        return songNames
    }
}
