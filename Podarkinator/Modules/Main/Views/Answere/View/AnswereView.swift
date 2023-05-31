//
//  answerView.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 01.05.2023.
//

import ComposableArchitecture
import SwiftUI

struct AnswerView: View {
    typealias State = AnswerState
    typealias Action = AnswerAction
    
    let store: Store<State, Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            Button {
                viewStore.send(.didTap(viewStore.answerEntity))
            } label: {
                text
            }
        }
    }
}

// MARK: - Private. Elements
private extension AnswerView {
    var text: some View {
        WithViewStore(store) { viewStore in
            Text(viewStore.answerText)
                .padding(20)
                .foregroundColor(.white)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.mint)
                )
        }
    }
}

// MARK: - Private. Actions
private extension AnswerView {
    
}

struct AnswerView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerView(
            store: .init(
                initialState: .init(.init(text: "Test", parameter: .init(.anime))),
                reducer: .empty,
                environment: Void()
            )
        )
    }
}
