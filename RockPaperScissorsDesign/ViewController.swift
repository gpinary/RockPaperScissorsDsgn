//
//  ViewController.swift
//  RockPaperScissorsDesign
//
//  Created by Gökçe Pınar Yıldız on 9.07.2023.
//

import UIKit

class ViewController: UIViewController {
    var yourScore = 0
    var computerScore = 0
    
    @IBAction func rock(_ sender: UIButton) {
        let computerChoice = randomComputerChoice()
        label.text = playGame(you: .rock, computer: computerChoice)
        yourChoice.image = UIImage(named: Choice.rock.rawValue)
        computerChoose.image = UIImage(named: computerChoice.rawValue)
        
    }
    
    @IBAction func paper(_ sender: UIButton) {
        let computerChoice = randomComputerChoice()
        label.text = playGame(you: .paper, computer: computerChoice)
        yourChoice.image = UIImage(named: Choice.paper.rawValue)
        computerChoose.image = UIImage(named: computerChoice.rawValue)
    }
    
    
    @IBAction func scissors(_ sender: UIButton) {
        let computerChoice = randomComputerChoice()
        label.text = playGame(you: .scissors, computer: computerChoice)
        yourChoice.image = UIImage(named: Choice.scissors.rawValue)
        computerChoose.image = UIImage(named: computerChoice.rawValue)
        
    }
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var yourChoice: UIImageView!
    @IBOutlet weak var computerChoose: UIImageView!
    @IBOutlet weak var yourScoreLabel: UILabel!
    @IBOutlet weak var computerScoreLabel: UILabel!
    
    @IBAction func replayGame(_ sender: UIButton) {
        resetGame()
    }
    enum Choice: String {
        case rock = "rock"
        case paper = "paper"
        case scissors = "scissors"
    }
    
    func randomComputerChoice() -> Choice {
        let choices:[Choice] = [.rock,.paper,.scissors]
        let index = Int.random(in: 0..<choices.count)
        let choice = choices[index]
        return choice
    }
    
    func playGame(you: Choice, computer:Choice) -> String{

        if you == computer {
            return "TIE!"
        }
        else if you == .rock && computer == .scissors || you == .paper && computer == .rock || you == .scissors && computer == .paper  {
            yourScore += 1
            updateScores()
            return "YOU WIN!"
        }
        else {
            computerScore += 1
            updateScores()
            return "COMPUTER WIN!"
            
        }

    }
    func updateScores() {
        yourScoreLabel.text = "Your score: \(yourScore)"
        computerScoreLabel.text = "PC score: \(computerScore)"
    }
    func resetGame() {
        yourScore = 0
        computerScore = 0
        yourScoreLabel.text = "Your score: \(yourScore)"
        computerScoreLabel.text = "PC score: \(computerScore)"
    }
}
