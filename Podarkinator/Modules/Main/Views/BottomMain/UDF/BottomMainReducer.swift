//
//  BottomMainReducer.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 06.06.2023.
//

import ComposableArchitecture

let bottomMainReducer = AnyReducer<BottomMainState, BottomMainAction, BottomMainEnvironment>.combine(
    answersReducer.pullback(
        state: \BottomMainState.answers,
        action: /BottomMainAction.answers,
        environment: { _ in .init() }
    )
)

