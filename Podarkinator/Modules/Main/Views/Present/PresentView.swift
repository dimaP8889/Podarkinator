//
//  PresentView.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 09.05.2023.
//

import ComposableArchitecture
import SwiftUI

struct PresentView: View {
    typealias State = PresentState
    typealias Action = PresentAction
    
    let store: Store<State, Action>
    
    var body: some View {
        VStack {
            image
            link
            startAgainButton
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.mint)
        )
    }
}

// MARK: - Private. Elements
private extension PresentView {
    var image: some View {
        WithViewStore(store) { viewStore in
            AsyncImage(url: URL(string: viewStore.present.image)!) { image in
                image
                    .resizable()
                    .frame(width: 250, height: 250)
            } placeholder: {
                Color.cyan
            }
        }
    }
    
    var link: some View {
        WithViewStore(store) { viewStore in
            Link(viewStore.present.link, destination: URL(string: viewStore.present.link)!)
        }
    }
    
    var startAgainButton: some View {
        WithViewStore(store) { viewStore in
            Button("Начать заново?") {
                viewStore.send(.startAgain)
            }
            .foregroundColor(.black)
            .padding(.top, 20)
        }
    }
}

// MARK: - Private. Actions
private extension PresentView {
    
}

struct PresentView_Previews: PreviewProvider {
    static var previews: some View {
        PresentView(
            store: .init(
                initialState: .init(present: PresentsData().animeHigh1),
                reducer: .empty,
                environment: PresentEnvironment()
            )
        )
    }
}
