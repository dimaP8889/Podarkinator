//
//  AnswersState.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 06.06.2023.
//

import ComposableArchitecture
import SwiftUI

struct AnswersState {
    var answers: IdentifiedArrayOf<SingleAnswerState>
    var colums: [GridItem]
    
    init(answers: [Answer]) {
        let answersState = answers.map { SingleAnswerState(answer: $0) }
        self.answers = .init(uniqueElements: answersState)
        
        colums = {
            let item = GridItem(.fixed(100), spacing: 12)
            if answers.count == 1 {
                return [item]
            }
            if answers.count < 5 {
                return [item, item]
            }
            if answers.count >= 5 {
                return [item, item, item]
            }
            return [item]
        }()
    }
}

extension AnswersState: Equatable {
    static func == (lhs: AnswersState, rhs: AnswersState) -> Bool {
        lhs.answers == rhs.answers
    }
}
