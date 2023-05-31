//
//  MainAction.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 01.05.2023.
//

import Foundation

enum MainAction: Equatable {
    case answer(id: UUID, answer: AnswerAction)
    case question(QuestionAction)
    case present(PresentAction)
}
