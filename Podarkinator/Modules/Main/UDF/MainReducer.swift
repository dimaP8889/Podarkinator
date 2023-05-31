//
//  MainReducer.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 01.05.2023.
//

import ComposableArchitecture

let mainReducer = AnyReducer<MainState, MainAction, MainEnvironment>.combine(
    answerReducer.forEach(
        state: \.answers,
        action: /MainAction.answer,
        environment: { _ in Void() }
    ),
    presentReducer.optional().pullback(
        state: \.present,
        action: /MainAction.present,
        environment: { _ in .init() }
    ),
    AnyReducer { state, action, environment in
        switch action {
        case let .answer(_, answerAction):
            switch answerAction {
            case let .didTap(answer):
                guard let node = environment.treeManager.next(for: answer) else {
                    return .none
                }
                state = .init(currentNode: node)
                if let present = node.getPresent() {
                    state.present = .init(present: present)
                }
            }
            return .none
        case let .present(presentAction):
            switch presentAction {
            case .startAgain:
                state.present = nil
                let node = environment.treeManager.startAgain()
                state = .init(currentNode: node)
            }
            return .none
        default:
            return .none
        }
    }
)

