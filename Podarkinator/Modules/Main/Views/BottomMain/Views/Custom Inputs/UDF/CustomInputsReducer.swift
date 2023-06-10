//
//  CustomInputsReducer.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 10.06.2023.
//

import ComposableArchitecture

let customInputsReducer = AnyReducer<CustomInputsState, CustomInputsAction, CustomInputsEnvironment>.combine(
    nameInputReducer.pullback(
        state: /CustomInputsState.name,
        action: /CustomInputsAction.name,
        environment: { _ in .init() }
    ),
    numberInputReducer.pullback(
        state: /CustomInputsState.number,
        action: /CustomInputsAction.number,
        environment: { _ in .init() }
    )
)

