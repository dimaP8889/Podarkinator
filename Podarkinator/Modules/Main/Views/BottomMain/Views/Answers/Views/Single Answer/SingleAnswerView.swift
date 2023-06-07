//
//  SingleAnswerView.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 06.06.2023.
//

import ComposableArchitecture
import SwiftUI

struct SingleAnswerView: View {
    typealias State = SingleAnswerState
    typealias Action = SingleAnswerAction
    
    let store: Store<State, Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                Spacer()
                Image(viewStore.answer.image)
                Spacer()
                Text(viewStore.answer.text)
                    .foregroundColor(.text)
                    .font(.main(size: 13))
                Spacer()
            }
            .padding(.horizontal, 3)
            .multilineTextAlignment(.center)
            .frame(width: 100, height: 100)
            .background(
                RoundedRectangle(
                    cornerRadius: 14
                )
                .strokeBorder(Color.text, lineWidth: 1)
            )
            .contentShape(Rectangle())
            .onTapGesture {
                viewStore.send(.didTapAnswer(viewStore.answer.parameter))
            }
            .scaleOnTap(scaleFactor: .min, isHaptick: true)
        }
    }
}

struct SingleAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        SingleAnswerView(
            store: .init(
                initialState: .init(answer: .init(image: "done_ic", text: "Test")),
                reducer: .empty,
                environment: SingleAnswerEnvironment()
            )
        )
    }
}
