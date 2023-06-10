//
//  BottomMainView.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 06.06.2023.
//

import ComposableArchitecture
import SwiftUI

struct BottomMainView: View {
    typealias State = BottomMainState
    typealias Action = BottomMainAction
    
    let store: Store<State, Action>
    
    var body: some View {
        ZStack {
            slider
            info
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: UIScreen.main.bounds.height / 2)
    }
}

// MARK: - Private. Elements
private extension BottomMainView {
    var slider: some View {
        VStack {
            Image("slider")
                .resizable()
                .padding(.horizontal, 20)
        }
        .ignoresSafeArea()
    }
    
    var info: some View {
        WithViewStore(self.store) { viewStore in
            VStack {
                question
                Spacer()
                customInput
                if viewStore.customInputState != nil {
                    Spacer()
                }
                answers
                Spacer()
            }
            .ignoresSafeArea()
        }
    }
    
    var question: some View {
        WithViewStore(self.store) { viewStore in
            Text(viewStore.question)
                .foregroundColor(.text)
                .font(.main(size: 20, weight: .bold))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 38)
                .padding(.top, 53)
        }
    }
    
    var customInput: some View {
        WithViewStore(self.store) { viewStore in
            IfLetStore(
                store.scope(
                    state: \.customInputState,
                    action: Action.customInputs
                ), then: { viewStore in
                    CustomInputsView(store: viewStore)
                }
            )
            .padding(.horizontal, 78)
        }
    }
    
    var answers: some View {
        WithViewStore(self.store) { viewStore in
            AnswersView(store: store.scope(
                state: \.answers,
                action: BottomMainAction.answers
            ))
        }
        .padding(.bottom, 30)
    }
}

// MARK: - Private. Actions
private extension BottomMainView {
    
}

struct BottomMainView_Previews: PreviewProvider {
    static var previews: some View {
        BottomMainView(
            store: .init(
                initialState: .init(question: "Hello world", customInput: nil, answers: []),
                reducer: .empty,
                environment: BottomMainEnvironment()
            )
        )
    }
}
