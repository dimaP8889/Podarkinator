//
//  RootState.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 01.05.2023.
//

struct RootState: Equatable {
    var main: MainState
    
    init() {
        self.main = MainState(top: .init(), bottom: .init(question: "Start", customInput: nil, answers: []))
    }
}

