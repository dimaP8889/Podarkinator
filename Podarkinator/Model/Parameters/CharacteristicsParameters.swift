//
//  CharacteristicsParameters.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 05.05.2023.
//

import Foundation

struct CharacteristicsParameters: OptionSet, Equatable, Hashable {
    let rawValue: Int

    // Sex Layer
    static let men          = CharacteristicsParameters(rawValue: 1 << 0)
    static let women        = CharacteristicsParameters(rawValue: 1 << 1)
    
    // Personality Layer
    static let father       = CharacteristicsParameters(rawValue: 1 << 2)
    static let brother      = CharacteristicsParameters(rawValue: 1 << 3)
    static let boyfriend    = CharacteristicsParameters(rawValue: 1 << 4)
    
    static let mother       = CharacteristicsParameters(rawValue: 1 << 5)
    static let girlfriend   = CharacteristicsParameters(rawValue: 1 << 6)
    static let bff          = CharacteristicsParameters(rawValue: 1 << 7)
    
    // Budget Later
    static let under50      = CharacteristicsParameters(rawValue: 1 << 8)
    static let from50to100  = CharacteristicsParameters(rawValue: 1 << 9)
    static let over100      = CharacteristicsParameters(rawValue: 1 << 10)
    
    // Hobby Layer
    static let fishing      = CharacteristicsParameters(rawValue: 1 << 11)
    static let football     = CharacteristicsParameters(rawValue: 1 << 12)
    static let gaming       = CharacteristicsParameters(rawValue: 1 << 13)
    
    static let jewelry      = CharacteristicsParameters(rawValue: 1 << 14)
    static let anime        = CharacteristicsParameters(rawValue: 1 << 15)
    static let sport        = CharacteristicsParameters(rawValue: 1 << 16)
    
    static let noFirstHobby = CharacteristicsParameters(rawValue: 1 << 17)
    static let noSecondHobby = CharacteristicsParameters(rawValue: 1 << 18)
}

// MARK: - Debug
extension CharacteristicsParameters: CustomStringConvertible {
    static var debugDescriptions: [CharacteristicsParameters: String] = {
        var descriptions = [CharacteristicsParameters: String]()
        descriptions[.men] = "men"
        descriptions[.women] = "women"
        descriptions[.father] = "father"
        descriptions[.brother] = "brother"
        descriptions[.boyfriend] = "boyfriend"
        descriptions[.mother] = "mother"
        descriptions[.girlfriend] = "girlfriend"
        descriptions[.bff] = "bff"
        descriptions[.under50] = "under50"
        descriptions[.from50to100] = "from50to100"
        descriptions[.over100] = "over100"
        descriptions[.fishing] = "fishing"
        descriptions[.football] = "football"
        descriptions[.gaming] = "gaming"
        descriptions[.jewelry] = "jewelry"
        descriptions[.anime] = "anime"
        descriptions[.sport] = "sport"
        descriptions[.noFirstHobby] = "noFirstHobby"
        descriptions[.noSecondHobby] = "noSecondHobby"
        return descriptions
    }()
    
    public var description: String {
        var result = [String]()
        for key in CharacteristicsParameters.debugDescriptions.keys {
            guard self.contains(key),
                  let description = CharacteristicsParameters.debugDescriptions[key]
            else { continue }
            result.append(description)
        }
        return "\(result)"
    }
}

// MARK: - Groups
extension CharacteristicsParameters {
    static let genders: CharacteristicsParameters              = [.men, .women]
    
    static let allPersonalities: CharacteristicsParameters     = [malePersonality, femalePersonality]
    static let malePersonality: CharacteristicsParameters      = [.father, .brother, .boyfriend]
    static let femalePersonality: CharacteristicsParameters    = [.mother, .girlfriend, .bff]
    
    static let budgets: CharacteristicsParameters              = [.under50, .from50to100, .over100]
    
    static let allHobbies: CharacteristicsParameters           = [.fishing, .jewelry, .football, .anime, .gaming, .sport]
    static let firstLayerHobbies: CharacteristicsParameters    = [.fishing, .jewelry, .noFirstHobby]
    static let secondLayerHobbies: CharacteristicsParameters   = [.football, .anime, .noSecondHobby]
    static let thirdLayerHobbies: CharacteristicsParameters    = [.gaming, .sport]
}

// MARK: - Present Groups
extension CharacteristicsParameters {
    static let fishingLowSet: CharacteristicsParameters = [.men, .fishing, .under50]
    static let fishingMediumSet: CharacteristicsParameters = [.men, .fishing, .from50to100]
    static let fishingHighSet: CharacteristicsParameters = [.men, .fishing, .over100]
    
    static let footballLowSet: CharacteristicsParameters = [.men, .football, .under50]
    static let footballMediumSet: CharacteristicsParameters = [.men, .football, .from50to100]
    static let footballHighSet: CharacteristicsParameters = [.men, .football, .over100]
    
    static let gamingLowSet: CharacteristicsParameters = [.men, .gaming, .under50]
    static let gamingMediumSet: CharacteristicsParameters = [.men, .gaming, .from50to100]
    static let gamingHighSet: CharacteristicsParameters = [.men, .gaming, .over100]
    
    static let jewelryLowSet: CharacteristicsParameters = [.women, .jewelry, .under50]
    static let jewelryMediumSet: CharacteristicsParameters = [.women, .jewelry, .from50to100]
    static let jewelryHighSet: CharacteristicsParameters = [.women, .jewelry, .over100]
    
    static let animeLowSet: CharacteristicsParameters = [.women, .anime, .under50]
    static let animeMediumSet: CharacteristicsParameters = [.women, .anime, .from50to100]
    static let animeHighSet: CharacteristicsParameters = [.women, .anime, .over100]
    
    static let sportLowSet: CharacteristicsParameters = [.women, .sport, .under50]
    static let sportMediumSet: CharacteristicsParameters = [.women, .sport, .from50to100]
    static let sportHighSet: CharacteristicsParameters = [.women, .sport, .over100]
}
