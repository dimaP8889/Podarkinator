//
//  MainState.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 01.05.2023.
//

import ComposableArchitecture

struct MainState: Equatable {
    var question: QuestionState?
    var answers: IdentifiedArrayOf<AnswerState>
    var present: PresentState?
    
    init(currentNode: TreeNode) {
        var answersArray = IdentifiedArrayOf<AnswerState>()
        currentNode.children.forEach {
            if let answer = $0.value.answer {
                answersArray.append(AnswerState(answer))
            }
        }
        self.answers = answersArray
        self.question = .init(question: currentNode.value.question)
    }
}

