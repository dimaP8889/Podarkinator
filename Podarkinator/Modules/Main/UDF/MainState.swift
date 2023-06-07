//
//  MainState.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 01.05.2023.
//

import ComposableArchitecture

struct MainState: Equatable {
    var top: TopMainState
    var bottom: BottomMainState
}

