//
//  PodarkinatorApp.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 01.05.2023.
//

import SwiftUI
import ComposableArchitecture

private let store = Store(
    initialState: RootState(),
    reducer: rootReducer,
    environment: RootEnvironment()
)

@main
struct PodarkinatorApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(store: store)
        }
    }
}
