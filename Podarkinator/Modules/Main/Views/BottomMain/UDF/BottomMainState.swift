//
//  BottomMainState.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 06.06.2023.
//

struct BottomMainState: Equatable {
    var question: String
    var customInputState: CustomInputsState?
    var answers: AnswersState
    
    var customInputValue: Any? {
        switch customInputState {
        case let .name(state):
            return state.value
        case let .number(state):
            return state.value
        default:
            return nil
        }
    }
    
    init(question: String, customInput: CustomInput?, answers: [Answer]) {
        self.question = question
        self.answers = .init(answers: answers)
        self.customInputState = {
            switch customInput {
            case .age:
                return .number(.init(type: .age))
            case .budget:
                return .number(.init(type: .budget))
            case .name:
                return .name(.init())
            default:
                return nil
            }
        }()
    }
}

