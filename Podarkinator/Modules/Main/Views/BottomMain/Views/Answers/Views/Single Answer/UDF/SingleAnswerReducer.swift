//
//  SingleAnswerReducer.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 06.06.2023.
//

import ComposableArchitecture

let singleAnswerReducer = AnyReducer<SingleAnswerState, SingleAnswerAction, SingleAnswerEnvironment> { state, action, environment in
    return .none
}

