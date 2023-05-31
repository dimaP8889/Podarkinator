//
//  Question.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 01.05.2023.
//

import Foundation

struct Question: Identifiable {
    let id = UUID()
    let body: QuestionBody
}

enum QuestionBody {
    case common(text: String)
    case present(text: String, present: Present)
    
    var text: String {
        switch self {
        case let .common(text):
            return text
        case let .present(text, _):
            return text
        }
    }
    
    var image: String? {
        switch self {
        case .common:
            return nil
        case let .present(_, present):
            return present.image
        }
    }
    
    var present: Present? {
        switch self {
        case .common:
            return nil
        case let .present(_, present):
            return present
        }
    }
}
