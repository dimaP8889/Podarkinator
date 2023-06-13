//
//  NameInputView.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 10.06.2023.
//

import ComposableArchitecture
import SwiftUI

struct NameInputView: View {
    typealias State = NameInputState
    typealias Action = NameInputAction
    
    let store: Store<State, Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            TextField("Введите имя", text: textFieldText(for: viewStore))
                .font(.main(size: 13))
                .foregroundColor(.text)
                .padding(.horizontal, 18)
                .padding(.vertical, 14)
                .background(
                    RoundedRectangle(
                        cornerRadius: 22
                    )
                    .strokeBorder(Color.text, lineWidth: 1)
                )
        }
    }
}

// MARK: - Private. Actions
private extension NameInputView {
    func textFieldText(for viewStore: ViewStore<State, Action>) -> Binding<String> {
        .init(
            get: { viewStore.state.value },
            set: { viewStore.send(.set(value: $0)) }
        )
    }
}

struct NameInputView_Previews: PreviewProvider {
    static var previews: some View {
        NameInputView(
            store: .init(
                initialState: .init(),
                reducer: nameInputReducer,
                environment: NameInputEnvironment()
            )
        )
    }
}
