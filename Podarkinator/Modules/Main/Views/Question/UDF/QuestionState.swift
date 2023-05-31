//
//  QuestionState.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 01.05.2023.
//

struct QuestionState: Equatable {
    var questionText: String
    var image: String?
    
    init(question: Question) {
        self.questionText = question.body.text
        self.image = question.body.image
    }
}

