//
//  NumberInputReducer.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 10.06.2023.
//

import ComposableArchitecture

let numberInputReducer = AnyReducer<NumberInputState, NumberInputAction, NumberInputEnvironment> { state, action, environment in
    switch action {
    case let .set(value):
        state.value = Int(value)
        return .none
    }
}

