//
//  Parameters.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 01.05.2023.
//

import Foundation

struct Parameters: Hashable {
    var characteristics = CharacteristicsParameters()
    var present = PresentParameters()
    
    static func + (lhs: Parameters, rhs: Parameters) -> Parameters {
        let characteristics: CharacteristicsParameters = [lhs.characteristics, rhs.characteristics]
        let present: PresentParameters = [lhs.present, rhs.present]
        return Parameters(characteristics: characteristics, present: present)
    }
    
    init(characteristics: CharacteristicsParameters = CharacteristicsParameters(),
        present: PresentParameters = PresentParameters()) {
        self.characteristics = characteristics
        self.present = present
    }
    
    // Init for characteristics
    init(_ characteristics: CharacteristicsParameters) {
        self.characteristics = characteristics
        self.present = PresentParameters()
    }
    
    // Init for present
    init(_ present: PresentParameters) {
        self.characteristics = CharacteristicsParameters()
        self.present = present
    }
    
    func contains(_ parameter: CharacteristicsParameters) -> Bool {
        characteristics.contains(parameter)
    }
    
    func contains(_ parameter: PresentParameters) -> Bool {
        present.contains(parameter)
    }
}

// Debug
extension Parameters: CustomStringConvertible {
    var description: String {
        return characteristics.description + " " + present.description
    }
    
    var characteristsDescription: String {
        return characteristics.description
    }
    
    var presentDescription: String {
        return present.description
    }
}
