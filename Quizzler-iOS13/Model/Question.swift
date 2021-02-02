//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Sergii Shamrai on 02.02.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let question: String
    let answer: String
    
    init(q: String, a: String) {
        self.question = q
        self.answer = a
    }
}
