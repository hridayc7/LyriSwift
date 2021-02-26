//
//  ViewController.swift
//  theLyricistBeta2
//
//  Created by Hriday Chhabria on 1/15/21.
//  Copyright © 2021 Hriday Chhabria. All rights reserved.

//This class mamnages all the UI Elements for thhe gameplay page
import UIKit

class GamePlayViewController: UIViewController {
    
    
    var timer = Timer()
    var timer2 = Timer()
    
    var score = 0
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeRemainingLabel: UILabel!
    @IBOutlet weak var livesLabel: UILabel!
    var lives = 3
    var timeLeft = 60
    
    @IBOutlet weak var viewPannel: UIView!
    
    var songTitles = DataTransfer1.songNames
    var index  = 0;
    @IBOutlet weak var creditsButton: UIButton!
    
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var songLine: UILabel!
    @IBOutlet weak var answerChoices: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    
    var currentSong = Song(songFileName: "Getaway_Car")

    
    //when the view loads a timer starts for 60 seconds
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        timer2 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(gameTimeHanndler), userInfo: nil, repeats: true)
        self.title = DataTransfer1.album
        updateUI()
        
    }

    //this one methid is an abstraction masterpiece. It contrils every element that changes after the user enters an answer.
    @objc func updateUI(){
    
        let tempSongFileName = songTitles[index]
        currentSong = Song(songFileName: tempSongFileName)
        self.songName.text = currentSong.songTitle
        self.songLine.text = currentSong.questionText
        buttonUpdates()
        
    }
    
    //This functiion handles the game timer
    @objc func gameTimeHanndler(){
        timeLeft -= 1
        timeRemainingLabel.text = "Time Remaining: \(timeLeft)"
        if(timeLeft == 0){
            gameOver()
        }
    }
    
    //This function is called when the user selects an answer
    @IBAction func answerChoiceTapped(_ sender: UIButton) {
        //This if statement checks if the answer was correct
        if sender.titleLabel?.text! == currentSong.correctAnswer {
            print("Correct")
            score += 10
            //Think of Creating a streak variable
            sender.setTitleColor(UIColor.black, for: UIControl.State.normal)
            scoreLabel.text = "Score \(score)"
            
            sender.backgroundColor = UIColor.green
            sender.pulsate()
        }
        //This is what happens with an incorrect answer
        else{
            sender.backgroundColor = UIColor.red
            if(lives > 0){
               lives -= 1
                updateLives()
            }
            print("Oops")
            sender.shake()
        }
        
        if(self.index == songTitles.count-1){
            self.index = 0
        }
        else{
           self.index += 1;
        }
        
        Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    //This updates all the buttons with new annswer choices for new songs. Abstractionn masterpiece
    func buttonUpdates() {
        
        let firstOption = currentSong.answerChoices.randomElement()!
        currentSong.answerChoices.remove(firstOption)
        button1.setTitle(firstOption, for: .normal)
        
        let numberTwo = currentSong.answerChoices.randomElement()!
        currentSong.answerChoices.remove(numberTwo)
        button2.setTitle(numberTwo, for: .normal)
        
        let thirdOption = currentSong.answerChoices.randomElement()!
        currentSong.answerChoices.remove(thirdOption)
        button3.setTitle(thirdOption, for: .normal)
        
        let fourthOption = currentSong.answerChoices.randomElement()!
        currentSong.answerChoices.remove(fourthOption)
        button4.setTitle(fourthOption, for: .normal)
        
        button1.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button2.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button3.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button4.setTitleColor(UIColor.white, for: UIControl.State.normal)
        
        button1.backgroundColor = UIColor.systemIndigo
        button2.backgroundColor = UIColor.systemIndigo
        button3.backgroundColor = UIColor.systemIndigo
        button4.backgroundColor = UIColor.systemIndigo
        
        
        buttonShadows(button: button1)
        buttonShadows(button: button2)
        buttonShadows(button: button3)
        buttonShadows(button: button4)
 
    }
    
    //This segues to the credits page
    @IBAction func creditsButtonTapped(_ sender: Any) {
        //performSegue(withIdentifier: "creditsSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? creditsViewController else { return }
        destinationVC.currentSong = self.currentSong
    }

    //All UI related stuff here
    
    
    func buttonShadows(button: UIButton) {
        button.layer.cornerRadius = 20.0
        /*
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.layer.shadowRadius = 15
        button.layer.shadowOpacity = 0.5
         */
    }
    
    //Updates the lables for the lives.
    func updateLives(){
        switch lives {
        case 2:
            livesLabel.text = "Lives: ❤️❤️💔"
        case 1:
            livesLabel.text = "Lives: ❤️💔💔"
        case 0:
            livesLabel.text = "Lives: 💔💔💔"
            gameOver()
        default:
            livesLabel.text = "Lives: ❤️❤️❤️"
        }
    }
    
    //This method is called when the user has lost or the timer has ended.
    func gameOver(){
        print("The Game Has Ended")
        timer2.invalidate()
        DataTransfer2.changeScore(x: self.score)
        if(self.score > gamePlayer.highScore){
            gamePlayer.highScore = self.score
            defaults.set(self.score, forKey: Keys.highScore)
            defaults.set(DataTransfer1.album, forKey: "album")
        }
        performSegue(withIdentifier: "gameOver", sender: nil)
        //presentView with gameOver message
        //update User Defaults
            //correctQuestions
            //newHighSchore
        //repHS vs loverHS etc.
    }
}

