//
//  AnswersReducer.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 06.06.2023.
//

import ComposableArchitecture

let answersReducer = AnyReducer<AnswersState, AnswersAction, AnswersEnvironment>.combine(
    singleAnswerReducer.forEach(
        state: \AnswersState.answers,
        action: /AnswersAction.answer,
        environment: { _ in .init() }
    )
)

