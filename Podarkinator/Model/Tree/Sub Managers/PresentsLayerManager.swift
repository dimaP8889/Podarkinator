//
//  PresentsLayerManager.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 06.05.2023.
//

import Foundation

final class PresentsLayersManager {
    static var shared = PresentsLayersManager()
    
    private init() {}
    
    func currentLayer(for parameters: PresentParameters) -> PresentLayer {
        if parameters.isEmpty {
            return .firstPresent
        }
        
        if !parameters.isDisjoint(with: PresentParameters.anyPresent) {
            return .finishPresent
        }
        
        if !parameters.isDisjoint(with: PresentParameters.firstPresentLayer),
           parameters.isDisjoint(with: PresentParameters.secondPresentLayer) {
            return .secondPresent
        }
        
        if !parameters.isDisjoint(with: PresentParameters.firstPresentLayer),
           !parameters.isDisjoint(with: PresentParameters.secondPresentLayer),
           parameters.isDisjoint(with: PresentParameters.thirdPresentLayer) {
            
            return .thirdPresent
        }
        
        return .finishPresent
    }
}

enum PresentLayer {
    case firstPresent
    case secondPresent
    case thirdPresent
    case finishPresent
}
