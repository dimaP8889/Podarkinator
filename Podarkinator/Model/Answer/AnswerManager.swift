//
//  AnswerManager.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 02.05.2023.
//

import Foundation

final class AnswerManager {
    static var shared = AnswerManager()
    
    private let characteristicManager = CharacteristicsAnswersManager.shared
    private let presentsManager = PresentsAnswersManager.shared
    
    private init() {}
    
    func answers(for parameters: Parameters) -> [Answer] {
        let characteristic = characteristicManager.answers(for: parameters.characteristics)
        let presents = presentsManager.answers(for: parameters.present)
        
        guard characteristic != nil else {
            return presents ?? []
        }
        return characteristic!
    }
    
    func answersForCharacteristics(with parameters: Parameters) -> [Answer]? {
        characteristicManager.answers(for: parameters.characteristics)
    }
    
    func answersForPresents(with parameters: Parameters) -> [Answer]? {
        presentsManager.answers(for: parameters.present)
    }
}
