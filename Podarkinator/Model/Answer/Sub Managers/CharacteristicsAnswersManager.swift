//
//  CharacteristicsAnswersManager.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 06.05.2023.
//

import Foundation

final class CharacteristicsAnswersManager {
    static var shared = CharacteristicsAnswersManager()
    
    private init() {}
    
    func answers(for parameters: CharacteristicsParameters) -> [Answer]? {
        let currentLayer = CharacteristicLayersManager.shared.currentLayer(for: parameters)
        let answers = CharacteristicsAnswersData()
        
        switch currentLayer {
        case .sex:
            return answers.sexLayerAnswers
        case .personality:
            if parameters.contains(.men) {
                return answers.personalityLayerAnswersMale
            }
            if parameters.contains(.women) {
                return answers.personalityLayerAnswersFemale
            }
        case .budget:
            return answers.budgetLayerAnswers
        case .firstHobby:
            if parameters.contains(.men) {
                return answers.hobbyFishingAnswers
            }
            if parameters.contains(.women) {
                return answers.hobbyJewelryAnswers
            }
        case .secondHobby:
            if parameters.contains(.men) {
                return answers.hobbyFootballAnswers
            }
            if parameters.contains(.women) {
                return answers.hobbyAnimeAnswers
            }
        case .thirdHobby:
            if parameters.contains(.men) {
                return answers.hobbyGamesAnswers
            }
            if parameters.contains(.women) {
                return answers.hobbySportAnswers
            }
        case .finishPresent:
            return nil
        }
        return nil
    }
}

struct CharacteristicsAnswersData {
    // Sex
    let sexLayerAnswers: [Answer] = {
        let men = Answer(text: "Мужчина", parameter: .init(.men))
        let women = Answer(text: "Женшина", parameter: .init(.women))
        return [men, women]
    }()
    
    // Personality
    let personalityLayerAnswersMale: [Answer] = {
        let father = Answer(text: "Отец", parameter: .init(.father))
        let brother = Answer(text: "Парень", parameter: .init(.brother))
        let boyfriend = Answer(text: "Друг", parameter: .init(.boyfriend))
        return [father, brother, boyfriend]
    }()
    let personalityLayerAnswersFemale: [Answer] = {
        let mother = Answer(text: "Мать", parameter: .init(.mother))
        let girlfriend = Answer(text: "Девушка", parameter: .init(.girlfriend))
        let bff = Answer(text: "Подруга", parameter: .init(.bff))
        return [mother, girlfriend, bff]
    }()
    
    // Budget
    let budgetLayerAnswers: [Answer] = {
        let under50 = Answer(text: "До 50$", parameter: .init(.under50))
        let from50to100 = Answer(text: "50$-100$", parameter: .init(.from50to100))
        let over100 = Answer(text: "Больше 100$", parameter: .init(.over100))
        return [under50, from50to100, over100]
    }()
    
    // Hobby
    let hobbyFishingAnswers: [Answer] = {
        let yes = Answer(text: "Да", parameter: .init(.fishing))
        let no = Answer(text: "Нет", parameter: .init(.noFirstHobby))
        return [yes, no]
    }()
    
    let hobbyFootballAnswers: [Answer] = {
        let yes = Answer(text: "Да", parameter: .init(.football))
        let no = Answer(text: "Нет", parameter: .init(.noSecondHobby))
        return [yes, no]
    }()
    
    let hobbyGamesAnswers: [Answer] = {
        let yes = Answer(text: "Да", parameter: .init(.gaming))
        return [yes]
    }()
    
    let hobbyJewelryAnswers: [Answer] = {
        let yes = Answer(text: "Да", parameter: .init(.jewelry))
        let no = Answer(text: "Нет", parameter: .init(.noFirstHobby))
        return [yes, no]
    }()
    
    let hobbyAnimeAnswers: [Answer] = {
        let yes = Answer(text: "Да", parameter: .init(.anime))
        let no = Answer(text: "Нет", parameter: .init(.noSecondHobby))
        return [yes, no]
    }()
    
    let hobbySportAnswers: [Answer] = {
        let yes = Answer(text: "Да", parameter: .init(.sport))
        return [yes]
    }()
}
