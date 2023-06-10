//
//  MainReducer.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 01.05.2023.
//

import ComposableArchitecture

let mainReducer = AnyReducer<MainState, MainAction, MainEnvironment>.combine(
    topMainReducer.pullback(
        state: \.top,
        action: /MainAction.top,
        environment: { _ in .init() }
    ),
    bottomMainReducer.pullback(
        state: \.bottom,
        action: /MainAction.bottom,
        environment: { _ in .init() }
    ),
    AnyReducer { state, action, environment in
        switch action {
        case .onAppear:
            state = environment.flowManager.next()
            return .none
        case let .bottom(bottomAction):
            switch bottomAction {
            case let .answers(answersAction):
                switch answersAction {
                case let .answer(_, singleAnswerAction):
                    switch singleAnswerAction {
                    case let .didTapAnswer(parameter):
                        let value = state.bottom.customInputValue
                        environment.flowManager.setPerson(parameter: parameter, with: value)
                        state = environment.flowManager.next()
                        return .none
                    }
                }
            case .customInputs:
                return .none
            }
        default:
            return .none
        }
    }
)

