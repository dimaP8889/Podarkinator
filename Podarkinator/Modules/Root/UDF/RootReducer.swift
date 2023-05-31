//
//  RootReducer.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 01.05.2023.
//

import ComposableArchitecture

let rootReducer = AnyReducer<RootState, RootAction, RootEnvironment>.combine(
    mainReducer.pullback(
        state: \.main,
        action: /RootAction.main,
        environment: { env in env.mainEnvironment }
    )
)

