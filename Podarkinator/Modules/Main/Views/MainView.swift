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
        ZStack {
            VStack {
                topView
                answersView
            }
            presentView
        }
    }
}

// MARK: - Private. Elements
private extension MainView {
    var topView: some View {
        VStack {
            questionView
            Spacer()
        }
        .background(Color.clear)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: UIScreen.main.bounds.height / 3)
    }
    
    var questionView: some View {
        IfLetStore(store.scope(
            state: \.question,
            action: MainAction.question
        )) { viewStore in
            QuestionView(store: viewStore)
        }
    }
    
    var answersView: some View {
        ForEachStore(store.scope(
            state: \.answers,
            action: MainAction.answer)
        ) { viewStore in
            AnswerView(store: viewStore)
        }
    }
    
    var presentView: some View {
        IfLetStore(store.scope(
            state: \.present,
            action: MainAction.present
        )) { viewStore in
            PresentView(store: viewStore)
        }
    }
}

// MARK: - Private. Actions
private extension MainView {
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(
            store: .init(
                initialState: .init(currentNode: TreeManager.shared.tree),
                reducer: .empty,
                environment: MainEnvironment()
            )
        )
    }
}
