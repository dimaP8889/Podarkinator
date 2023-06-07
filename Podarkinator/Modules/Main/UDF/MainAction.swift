//
//  MainAction.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 01.05.2023.
//

import Foundation

enum MainAction: Equatable {
    case top(TopMainAction)
    case bottom(BottomMainAction)
    
    case onAppear
}
