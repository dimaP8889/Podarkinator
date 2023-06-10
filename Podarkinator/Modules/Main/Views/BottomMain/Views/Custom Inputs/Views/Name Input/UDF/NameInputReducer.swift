//
//  NameInputReducer.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 10.06.2023.
//

import ComposableArchitecture

let nameInputReducer = AnyReducer<NameInputState, NameInputAction, NameInputEnvironment> { state, action, environment in
    switch action {
    case let .set(value):
        state.value = value
        return .none
    }
}

