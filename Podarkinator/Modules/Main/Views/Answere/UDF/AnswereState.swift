//
//  answerState.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 01.05.2023.
//

import Foundation

struct AnswerState: Equatable, Identifiable {
    var id = UUID()
    var answerEntity: Answer
    var answerText: String {
        answerEntity.text
    }
    
    init(_ answer: Answer) {
        self.answerEntity = answer
    }
}

