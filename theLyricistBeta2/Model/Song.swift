//
//  song.swift
//  theLyricistBeta2
//
//  Created by Hriday Chhabria on 1/7/21.
//  Copyright © 2021 Hriday Chhabria. All rights reserved.
//

import Foundation
import UIKit

struct Song {
    var songTitle = ""
    var LargeSongList: [String] = [];
    var mainLyricList: [String] = [];
    
    var source = ""
    var songWriters = ""
    var copyRights = ""
    var questionText = ""
    
    var validAnswers = Set<String>()
    var answerChoices = Set<String>()
    var correctAnswer = ""
    
    //This is the initializer that makes use of all the other helped methods given below.
    init(songFileName: String) {
        let songString = makeString(fileTitle: songFileName)
        self.LargeSongList = convertSongStringToListofLines(songText: songString)
        self.mainLyricList = getLyricsOnly(mainContentsArray: self.LargeSongList)
        self.songTitle = self.LargeSongList[0]
        loadCredits(mainContensArray: self.LargeSongList)
        self.copyRights = fixStrings(stringToFix: copyRights)
        self.songWriters = fixStrings(stringToFix: songWriters)
        self.generateQuestionAndAnswers()
    }

    /// This function converts a given textFile to a string containing the contents of the text file.
    /// - Parameter fileTitle: This is the text file that contains the lyrics and supplementary information about the song
    /// - Returns: This function returns a string variable containing all the contents of the text file.
    func makeString(fileTitle: String) -> String {
        var songToReturn = "" //An emptyContainer which will be used reo return the song.
        
        if let filepath = Bundle.main.path(forResource: fileTitle, ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filepath)
                songToReturn = contents //adds the string contents of the song to the containerString
            } catch {
                // contents could not be loaded
            }
        } else {
            // example.txt not found!
        }
        return songToReturn
    }
    
    
    /// This function takes in a string variable containing the lyrics to the song. It should be used only after makeString has been implemented correctly.
    /// - Parameter songText: This parameter is the string parameter containing all the lyrics of a song as well as other information.
    /// - Returns: This function returns an Array of all the lines in the string file,. It uses line breaks to split lines.
    func convertSongStringToListofLines(songText: String) ->  [String]{
        let lines = songText.components(separatedBy: "\n")
        return lines
    }
    
    /// This function trims the main lyrics list in order to get only the songLyrics in an array
    /// - Parameter mainContentsArray: This is the entire text file split up into elements in an array
    /// - Returns: This is the lyrics portion of the text file
    func getLyricsOnly(mainContentsArray: [String]) -> [String] {
        var mainLines = ["Line 1", "Line 2"]
        mainLines.removeAll()
        
        let top = mainContentsArray.firstIndex(of: "Song Stop")!
    
        
        for index in 1...top-1{
            mainLines.append(mainContentsArray[index])
        }
        
        return mainLines
    }
    
    
    /// This Metod takes in the mainContents string array and breaks down the copyright information from it. This is stored alongside the song to give the songwriters and producers credit for the amazing songs they have produced whose lyrics are being referenced in the song
    /// - Parameter mainContensArray: This is the entire text file split up into the elements in an array
    mutating func loadCredits(mainContensArray: [String]){
        let sourceIndex = mainContensArray.firstIndex(of: "Source")!
        let sourceMeth = mainContensArray[sourceIndex+1];
        self.source = sourceMeth //sources loaded
        
        var songWriterIndex = mainContensArray.firstIndex(of: "SongWriters")!
        var songWritersMeth = ""
        var flag = false
        while !flag {
            if((mainContensArray[songWriterIndex] == "---------------") == false){
                songWritersMeth += mainContensArray[songWriterIndex + 1]
                songWriterIndex =  songWriterIndex + 1
            }
            else{
                flag = true
            }
        }
        
        self.songWriters = songWritersMeth //songWriters Loaded
        
        
        
        var copyRightIndex = mainContensArray.firstIndex(of: "Copyright")!
        var copyRightMeth = ""
        
        var endReached = false
        
        while !endReached {
            if((mainContensArray[copyRightIndex] == "---------------") == false){
                copyRightMeth += mainContensArray[copyRightIndex + 1]
                copyRightIndex += 1
            }
            else{
                endReached = true
            }
        }
        
        self.copyRights = copyRightMeth
        
    }
 
    
    /// This Method is the main most important method. It sets the question that the user needs to answer and then it also populates answer choices that the user can pick from. It also sets the valid answer. More comments can be found inside.
    mutating func generateQuestionAndAnswers(){
        
        /*The questiontext is the variable that holds the given string to the user. It is the line that needs to be completed. Users are able to view the question text*/
        
        self.questionText = mainLyricList.randomElement()! //This line picks a random line from the song to display
        
        /*
         The following while loop is used to make sure that the line is not the last line or the first line of the song
         -> The First Element in the mainLyricList is the song name and is not a valid lyric
         -> The Last line doesn't have a possible ansnwer
         */
        while (self.questionText == mainLyricList.last! || self.questionText == mainLyricList.first!) {
            self.questionText = mainLyricList.randomElement()!
        }
        
        
        
        let top = mainLyricList.count - 1
        /*
         A paticuullar linen can have multiple answers. This adds all of them into a set of valid answers to rule out any duplilcate answers. The set data structure is of vital importance here.
         */
        for index in 0...top-1{
            if(mainLyricList[index] == self.questionText){
                validAnswers.insert(mainLyricList[index + 1])
            }
        }
        
        
        //The correct answer choice will always be the line that follows the first instance of the question.
        self.correctAnswer = validAnswers.popFirst()! //Sets the correct answer variable
        answerChoices.insert(self.correctAnswer) //This adds the first correct valid answer
        
        //This while loop populates the answer choices set. Set is used to prevent duplications of answer choices.
        while answerChoices.count < 4 {
            let possibleChoice = mainLyricList.randomElement()!
            if(!answerChoices.contains(possibleChoice)){
                answerChoices.insert(possibleChoice)
            }
        }
        
        //This is used to get the line before the main line for more context for the user when answering.
        let questIndex = mainLyricList.firstIndex(of: self.questionText)!
        self.questionText = mainLyricList[questIndex - 1] + "\n" + self.questionText
    }
    
    //This method simply cleans up the main string array
    func fixStrings(stringToFix: String) -> String {
        let parsed = stringToFix.replacingOccurrences(of: "---------------", with: "")
        return parsed
    }

}


