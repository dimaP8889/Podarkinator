//
//  QuestionManager.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 02.05.2023.
//

import Foundation

final class QuestionManager {
    static var shared = QuestionManager()
    
    private let characteristicManager = CharacteristicsQuestionManager.shared
    private let presentsManager = PresentsQuestionManager.shared
    
    private init() {}
    
    func question(for parameters: Parameters) -> Question {
        let characteristic = characteristicManager.question(for: parameters.characteristics)
        let presents = presentsManager.question(for: parameters)
        
        guard characteristic != nil else {
            return presents ?? Question(body: .common(text: "Error"))
        }
        return characteristic!
    }
}
