//
//  TopMainView.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 06.06.2023.
//

import ComposableArchitecture
import SwiftUI

struct TopMainView: View {
    typealias State = TopMainState
    typealias Action = TopMainAction
    
    let store: Store<State, Action>
    
    var body: some View {
        VStack(spacing: 35) {
            topText
            bigBrain
            bottomText
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: UIScreen.main.bounds.height / 2)
    }
}

// MARK: - Private. Elements
private extension TopMainView {
    var topText: some View {
        WithViewStore(self.store) { viewStore in
            if let text = viewStore.topText {
                Text(text)
                    .font(.main(size: 20, weight: .bold))
                    .foregroundColor(.text)
                    .multilineTextAlignment(.center)
            }
        }
    }
    
    var bigBrain: some View {
        Image("big_brain")
    }
    
    var bottomText: some View {
        WithViewStore(self.store) { viewStore in
            if let text = viewStore.bottomText {
                Text(text)
                    .font(.main(size: 20, weight: .bold))
                    .foregroundColor(.text)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

// MARK: - Private. Actions
private extension TopMainView {
    
}

struct TopMainView_Previews: PreviewProvider {
    static var previews: some View {
        TopMainView(
            store: .init(
                initialState: .init(topText: "Test Top", bottomText: "Test Bottom"),
                reducer: .empty,
                environment: TopMainEnvironment()
            )
        )
    }
}
