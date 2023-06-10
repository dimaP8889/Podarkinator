//
//  CustomInputsView.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 10.06.2023.
//

import ComposableArchitecture
import SwiftUI

struct CustomInputsView: View {
    typealias State = CustomInputsState
    typealias Action = CustomInputsAction
    
    let store: Store<State, Action>
    
    var body: some View {
        SwitchStore(self.store) {
            CaseLet(state: /State.name, action: Action.name) { nameStore in
                NameInputView(store: nameStore)
            }
            
            CaseLet(state: /State.number, action: Action.number) { numberStore in
                NumberInputView(store: numberStore)
            }
        }
    }
}

struct CustomInputsView_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputsView(
            store: .init(
                initialState: .name(.init()),
                reducer: .empty,
                environment: CustomInputsEnvironment()
            )
        )
    }
}
