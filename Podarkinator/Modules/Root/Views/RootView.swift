//
//  RootView.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 01.05.2023.
//

import ComposableArchitecture
import SwiftUI

struct RootView: View {
    typealias State = RootState
    typealias Action = RootAction
    
    let store: Store<State, Action>
    
    var body: some View {
        MainView(store: store.scope(
            state: \.main,
            action: RootAction.main
        ))
    }
}

// MARK: - Private. Elements
private extension RootView {
    
}

// MARK: - Private. Actions
private extension RootView {
    
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(
            store: .init(
                initialState: .init(),
                reducer: .empty,
                environment: RootEnvironment()
            )
        )
    }
}
