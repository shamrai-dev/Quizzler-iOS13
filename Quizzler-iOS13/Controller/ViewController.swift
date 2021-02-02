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
    
    var quizBrain = QuizBrain()
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
        if quizBrain.checkAnswer(userAnswer: sender.currentTitle!) {
            score += 1
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        UIView.animate(withDuration: 0.5) {
            sender.backgroundColor = UIColor.clear
        }
        quizBrain.currentQuestionIndex += 1
        progressBar.progress = Float(quizBrain.currentQuestionIndex) / Float(quizBrain.questions.count)
    }
    
    func resetProgress() {
        progressBar.progress = 0.0
        quizBrain.currentQuestionIndex = 0
        score = 0
        askNextQuestion()
    }
    
    func askNextQuestion() {
        if quizBrain.currentQuestionIndex < quizBrain.questions.count {
            questionLabel.text = quizBrain.questions[quizBrain.currentQuestionIndex].question
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

