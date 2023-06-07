//
//  BottomMainState.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 06.06.2023.
//

struct BottomMainState: Equatable {
    var question: String
    var answers: AnswersState
    
    init(question: String, answers: [Answer]) {
        self.question = question
        self.answers = .init(answers: answers)
    }
}

