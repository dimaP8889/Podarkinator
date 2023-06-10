//
//  NumberInputView.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 10.06.2023.
//

import ComposableArchitecture
import SwiftUI

struct NumberInputView: View {
    typealias State = NumberInputState
    typealias Action = NumberInputAction
    
    let store: Store<State, Action>
    
    var body: some View {
        VStack(spacing: 0) {
            currentValueView
            sliderView
            rangeLabels
        }
    }
}

// MARK: - Private. Elements
private extension NumberInputView {
    var currentValueView: some View {
        WithViewStore(store) { viewStore in
            Text("\(viewStore.value)\(viewStore.type.extraValue)")
                .font(.main(size: 15))
                .foregroundColor(.white)
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .foregroundColor(.text)
                )
                .padding(.bottom, 5)
        }
    }
    
    var sliderView: some View {
        WithViewStore(store) { viewStore in
            Slider(
                value: sliderValue(for: viewStore),
                in: viewStore.type.range,
                step: 1
            ) { isChanged in
            }
            .accentColor(.text)
            .padding(.bottom, 2)
        }
    }
    
    var rangeLabels: some View {
        WithViewStore(store) { viewStore in
            HStack {
                Text("\(viewStore.type.rangeStart)")
                    .font(.main(size: 15))
                    .foregroundColor(.text)
                Spacer()
                Text("\(viewStore.type.rangeEnd)")
                    .font(.main(size: 15))
                    .foregroundColor(.text)
            }
            .padding(.leading, 10)
            .padding(.trailing, 5)
        }
    }
}

// MARK: - Private. Actions
private extension NumberInputView {
    func sliderValue(for viewStore: ViewStore<State, Action>) -> Binding<Float> {
        .init(
            get: { Float(viewStore.state.value) },
            set: { viewStore.send(.set(value: $0)) }
        )
    }
}

struct NumberInputView_Previews: PreviewProvider {
    static var previews: some View {
        NumberInputView(
            store: .init(
                initialState: .init(type: .age),
                reducer: numberInputReducer,
                environment: NumberInputEnvironment()
            )
        )
    }
}
