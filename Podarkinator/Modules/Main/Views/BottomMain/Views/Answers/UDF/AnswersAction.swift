//
//  AnswersAction.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 06.06.2023.
//
import Foundation

enum AnswersAction: Equatable {
    case answer(id: UUID, answer: SingleAnswerAction)
}
