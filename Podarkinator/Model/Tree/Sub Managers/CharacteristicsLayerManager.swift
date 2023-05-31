//
//  CharacteristicsLayerManager.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 06.05.2023.
//

import Foundation

final class CharacteristicLayersManager {
    static var shared = CharacteristicLayersManager()
    
    private init() {}
    
    func currentLayer(for parameters: CharacteristicsParameters) -> CharacteristicLayer {
        if parameters.isEmpty {
            return .sex
        }
        
        if parameters == .men || parameters == .women {
            return .personality
        }
        
        if !parameters.isDisjoint(with:  CharacteristicsParameters.genders),
           !parameters.isDisjoint(with: CharacteristicsParameters.allPersonalities),
           parameters.isDisjoint(with: CharacteristicsParameters.budgets) {
            return .budget
        }
        
        if !parameters.isDisjoint(with: CharacteristicsParameters.allHobbies) {
            return .finishPresent
        }
        
        if !parameters.isDisjoint(with:  CharacteristicsParameters.genders),
           !parameters.isDisjoint(with: CharacteristicsParameters.allPersonalities),
           !parameters.isDisjoint(with: CharacteristicsParameters.budgets),
           parameters.isDisjoint(with: CharacteristicsParameters.firstLayerHobbies) {
            return .firstHobby
        }
        
        if !parameters.isDisjoint(with:  CharacteristicsParameters.genders),
           !parameters.isDisjoint(with: CharacteristicsParameters.allPersonalities),
           !parameters.isDisjoint(with: CharacteristicsParameters.budgets),
           parameters.isDisjoint(with: CharacteristicsParameters.secondLayerHobbies) {
            return .secondHobby
        }
        
        if !parameters.isDisjoint(with:  CharacteristicsParameters.genders),
           !parameters.isDisjoint(with: CharacteristicsParameters.allPersonalities),
           !parameters.isDisjoint(with: CharacteristicsParameters.budgets),
           parameters.isDisjoint(with: CharacteristicsParameters.thirdLayerHobbies) {
            return .thirdHobby
        }
        return .finishPresent
    }
}

enum CharacteristicLayer {
    case sex
    case personality
    case budget
    case firstHobby
    case secondHobby
    case thirdHobby
    case finishPresent
}
