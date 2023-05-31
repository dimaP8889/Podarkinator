//
//  PresentsAnswersManager.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 06.05.2023.
//

import Foundation

final class PresentsAnswersManager {
    static var shared = PresentsAnswersManager()
    
    private init() {}
    
    func answers(for parameters: PresentParameters) -> [Answer]? {
        let currentLayer = PresentsLayersManager.shared.currentLayer(for: parameters)
        let answers = PresentsAnswersData()
        
        switch currentLayer {
        case .firstPresent:
            return answers.firstPresentAnswers
        case .secondPresent:
            return answers.secondPresentAnswers
        case .thirdPresent:
            return answers.thirdPresentAnswers
        case .finishPresent:
            return nil
        }
    }
}

struct PresentsAnswersData {
    // First Present
    let firstPresentAnswers: [Answer] = {
        let yes = Answer(text: "Да", parameter: .init(.firstPresent))
        let another = Answer(text: "Посмотреть другой товар", parameter: .init(.noFirstPresent))
        return [yes, another]
    }()
    
    // Second Present
    let secondPresentAnswers: [Answer] = {
        let yes = Answer(text: "Да", parameter: .init(.secondPresent))
        let another = Answer(text: "Посмотреть другой товар", parameter: .init(.noSecondPresent))
        return [yes, another]
    }()
    
    // Third Present
    let thirdPresentAnswers: [Answer] = {
        let yes = Answer(text: "Да", parameter: .init(.thirdPresent))
        let another = Answer(text: "Выбрать другую категорию", parameter: .init(.noThirdPresent))
        return [yes, another]
    }()
}
