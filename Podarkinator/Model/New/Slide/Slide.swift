//
//  Slide.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 01.06.2023.
//

import Foundation

struct Slide: Equatable {
    var type: SlideType
}

enum SlideType: Equatable {
    #warning("Change later")
    static func == (lhs: SlideType, rhs: SlideType) -> Bool {
        return false
    }
    
    case intro(topText: String, bottomText: String, question: String, answers: [NewAnswer])
    case characteristics(question: String, answers: [NewAnswer])
    case present(present: NewPresent, question: String, answers: [NewAnswer])
    
    var topText: String? {
        switch self {
        case let .intro(topText, _, _, _):
            return topText
        case .characteristics:
            return nil
        case .present:
            return nil
        }
    }
    
    var bottomText: String? {
        switch self {
        case let .intro(_, bottomText, _, _):
            return bottomText
        case .characteristics:
            return nil
        case .present:
            return nil
        }
    }
    
    var isBigImage: Bool {
        switch self {
        case .intro:
            return false
        case .characteristics:
            return false
        case .present:
            return true
        }
    }
    
    var present: NewPresent? {
        switch self {
        case .intro:
            return nil
        case .characteristics:
            return nil
        case let .present(present, _, _):
            return present
        }
    }
    
    var question: String {
        switch self {
        case let .intro(_, _, question, _):
            return question
        case let .characteristics(question, _):
            return question
        case let .present(_, question, _):
            return question
        }
    }
    
    var answers: [NewAnswer] {
        switch self {
        case let .intro(_, _, _, answers):
            return answers
        case let .characteristics(_, answers):
            return answers
        case let .present(_, _, answers):
            return answers
        }
    }
}
