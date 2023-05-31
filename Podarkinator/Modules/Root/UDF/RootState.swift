//
//  RootState.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 01.05.2023.
//

struct RootState: Equatable {
    var main = MainState(currentNode: TreeManager.shared.tree)
}

