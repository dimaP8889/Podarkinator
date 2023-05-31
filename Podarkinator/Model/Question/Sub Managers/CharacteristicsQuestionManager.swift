//
//  CharacteristicsQuestionManager.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 06.05.2023.
//

import Foundation

final class CharacteristicsQuestionManager {
    static var shared = CharacteristicsQuestionManager()
    
    private init() {}
    
    func question(for parameters: CharacteristicsParameters) -> Question? {
        let currentLayer = CharacteristicLayersManager.shared.currentLayer(for: parameters)
        let questions = CharacteristicsQuestionData()
        
        switch currentLayer {
        case .sex:
            return Question(body: .common(text: questions.sexLayerQuestion))
        case .personality:
            return Question(body: .common(text: questions.personalityLayerQuestion))
        case .budget:
            return Question(body: .common(text: questions.budgetLayerQuestion))
        case .firstHobby:
            if parameters.contains(.men) {
                return Question(body: .common(text: questions.hobbyFishingQuestion))
            }
            if parameters.contains(.women) {
                return Question(body: .common(text: questions.hobbyJewelryQuestion))
            }
        case .secondHobby:
            if parameters.contains(.men) {
                return Question(body: .common(text: questions.hobbyFootballQuestion))
            }
            if parameters.contains(.women) {
                return Question(body: .common(text: questions.hobbyAnimeQuestion))
            }
        case .thirdHobby:
            if parameters.contains(.men) {
                return Question(body: .common(text: questions.hobbyGamingQuestion))
            }
            if parameters.contains(.women) {
                return Question(body: .common(text: questions.hobbySportQuestion))
            }
        case .finishPresent:
            return nil
        }
        return nil
    }
}

struct CharacteristicsQuestionData {
    let sexLayerQuestion = "Кому даришь подарок?"
    let personalityLayerQuestion = "Кем тебе приходится этот человек?"
    let budgetLayerQuestion = "Твой бюджет?"
    
    let hobbyFishingQuestion = "Ему нравится рыбалка?"
    let hobbyFootballQuestion = "Ему нравится футбол?"
    let hobbyGamingQuestion = "Ему нравится игры?"
    let hobbyJewelryQuestion = "Ей нравится украшения?"
    let hobbyAnimeQuestion = "Ей нравится аниме?"
    let hobbySportQuestion = "Ей нравится спорт?"
}
