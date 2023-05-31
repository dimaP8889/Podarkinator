//
//  TreeLayers.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 01.05.2023.
//

import Foundation

final class LayersManager {
    static var shared = LayersManager()
    
    private let characteristicLayer = CharacteristicLayersManager.shared
    private let presentLayer = PresentsLayersManager.shared
    
    private init() {}
    
    func currentLayer(for parameters: Parameters) -> Layer {
        let characteristicsLayer = characteristicLayer.currentLayer(for: parameters.characteristics)
        let presentLayer = presentLayer.currentLayer(for: parameters.present)
        
        if characteristicsLayer != .finishPresent {
            return .characteristics(characteristicsLayer)
        } else {
            return .present(presentLayer)
        }
    }
}

enum Layer {
    case characteristics(CharacteristicLayer)
    case present(PresentLayer)
}
