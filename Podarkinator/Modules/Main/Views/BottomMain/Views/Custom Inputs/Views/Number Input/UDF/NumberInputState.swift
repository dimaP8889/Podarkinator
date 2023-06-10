//
//  NumberInputState.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 10.06.2023.
//

struct NumberInputState: Equatable {
    var type: `Type`
    var value: Int
    
    init(type: `Type`) {
        self.type = type
        switch type {
        case .age:
            value = 28
        case .budget:
            value = 500
        }
    }
}

extension NumberInputState {
    enum `Type` {
        case age
        case budget
        
        var range: ClosedRange<Float> {
            return Float(rangeStart)...Float(rangeEnd)
        }
        
        var rangeStart: Int {
            switch self {
            case .age, .budget:
                return 1
            }
        }
        
        var rangeEnd: Int {
            switch self {
            case .age:
                return 99
            case .budget:
                return 999
            }
        }
        
        var extraValue: String {
            switch self {
            case .age:
                return ""
            case .budget:
                return "$"
            }
        }
    }
}
