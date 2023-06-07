//
//  AnswersView.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 06.06.2023.
//

import ComposableArchitecture
import SwiftUI

struct AnswersView: View {
    typealias State = AnswersState
    typealias Action = AnswersAction
    
    let store: Store<State, Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            LazyVGrid(columns: viewStore.colums, spacing: 12) {
                ForEachStore(store.scope(
                    state: \.answers,
                    action: AnswersAction.answer
                )) { viewStore in
                    SingleAnswerView(store: viewStore)
                }
            }
        }
    }
}

struct AnswersView_Previews: PreviewProvider {
    static var previews: some View {
        AnswersView(
            store: .init(
                initialState: .init(answers: [
                    .init(image: "done_ic", text: "Test1"),
                    .init(image: "done_ic", text: "Test2"),
                    .init(image: "done_ic", text: "Test3"),
                    .init(image: "done_ic", text: "Test4")
                ]),
                reducer: .empty,
                environment: AnswersEnvironment()
            )
        )
    }
}
