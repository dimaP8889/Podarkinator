//
//  QuestionView.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 01.05.2023.
//

import ComposableArchitecture
import SwiftUI

struct QuestionView: View {
    typealias State = QuestionState
    typealias Action = QuestionAction
    
    let store: Store<State, Action>
    
    var body: some View {
        VStack {
            text
            image
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.cyan)
        )
    }
}

// MARK: - Private. Elements
private extension QuestionView {
    var text: some View {
        WithViewStore(store) { viewStore in
            Text(viewStore.questionText)
                .padding(20)
                .foregroundColor(.white)
        }
    }
    
    var image: some View {
        WithViewStore(store) { viewStore in
            if let image = viewStore.image {
                AsyncImage(url: URL(string: image)!) { image in
                    image
                        .resizable()
                        .frame(width: 250, height: 250)
                } placeholder: {
                    Color.cyan
                }
            }
        }
    }
}

// MARK: - Private. Actions
private extension QuestionView {
    
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(
            store: .init(
                initialState: .init(question: .init(body: .common(text: "Test"))),
                reducer: .empty,
                environment: Void()
            )
        )
    }
}
