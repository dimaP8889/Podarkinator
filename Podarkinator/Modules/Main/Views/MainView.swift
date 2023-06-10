//
//  MainView.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 01.05.2023.
//

import ComposableArchitecture
import SwiftUI

struct MainView: View {
    typealias State = MainState
    typealias Action = MainAction
    
    let store: Store<State, Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            ZStack {
                Color.main
                    .ignoresSafeArea()
                VStack {
                    topView
                    bottomView
                }
            }
            .preferredColorScheme(.light)
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}

// MARK: - Private. Elements
private extension MainView {
    var topView: some View {
        TopMainView(
            store: store.scope(
                state: \.top,
                action: MainAction.top
            )
        )
    }
    
    var bottomView: some View {
        BottomMainView(
            store: store.scope(
                state: \.bottom,
                action: MainAction.bottom
            )
        )
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(
            store: .init(
                initialState: .init(top: .init(), bottom: .init(question: "Test", customInput: nil, answers: [])),
                reducer: .empty,
                environment: MainEnvironment()
            )
        )
    }
}
