//
//  PresentParameters.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 05.05.2023.
//

import Foundation

struct PresentParameters: OptionSet, Equatable, Hashable {
    let rawValue: Int
    
    // First Present Layer
    static let firstPresent     = PresentParameters(rawValue: 1 << 0)
    static let noFirstPresent   = PresentParameters(rawValue: 1 << 1)
    
    // Second Present Layer
    static let secondPresent    = PresentParameters(rawValue: 1 << 2)
    static let noSecondPresent  = PresentParameters(rawValue: 1 << 3)
    
    // Third Present Layer
    static let thirdPresent     = PresentParameters(rawValue: 1 << 4)
    static let noThirdPresent   = PresentParameters(rawValue: 1 << 5)
}

// MARK: - Debug
extension PresentParameters: CustomStringConvertible {
    static var debugDescriptions: [PresentParameters: String] = {
        var descriptions = [PresentParameters: String]()
        descriptions[.firstPresent] = "firstPresent"
        descriptions[.noFirstPresent] = "noFirstPresent"
        descriptions[.secondPresent] = "secondPresent"
        descriptions[.noSecondPresent] = "noSecondPresent"
        descriptions[.thirdPresent] = "thirdPresent"
        descriptions[.noThirdPresent] = "noThirdPresent"
        return descriptions
    }()
    
    public var description: String {
        var result = [String]()
        for key in PresentParameters.debugDescriptions.keys {
            guard self.contains(key),
                  let description = PresentParameters.debugDescriptions[key]
            else { continue }
            result.append(description)
        }
        return "\(result)"
    }
}

extension PresentParameters {
    static let anyPresent: PresentParameters           = [firstPresent, secondPresent, thirdPresent]
    static let firstPresentLayer: PresentParameters    = [firstPresent, noFirstPresent]
    static let secondPresentLayer: PresentParameters   = [secondPresent, noSecondPresent]
    static let thirdPresentLayer: PresentParameters    = [thirdPresent, noThirdPresent]
}
