//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    let questions = [
        Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")

    ]
    var currentQuestionIndex = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetProgress()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        acceptAnswer(sender: sender)
        askNextQuestion()
    }
    
    func acceptAnswer(sender: UIButton) {
        if questions[currentQuestionIndex].checkAnswer(userAnswer: sender.currentTitle!) {
            score += 1
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        UIView.animate(withDuration: 0.5) {
            sender.backgroundColor = UIColor.clear
        }
        currentQuestionIndex += 1
        progressBar.progress = Float(currentQuestionIndex) / Float(questions.count)
    }
    
    func resetProgress() {
        progressBar.progress = 0.0
        currentQuestionIndex = 0
        score = 0
        askNextQuestion()
    }
    
    func askNextQuestion() {
        if currentQuestionIndex < questions.count {
            questionLabel.text = questions[currentQuestionIndex].question
        } else {
            showResults()
        }
    }
    
    func showResults() {
        let alert = UIAlertController(title: nil, message: "Your score: \(score)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in self.resetProgress() }))
        self.present(alert, animated: true, completion: nil)
    }
}

