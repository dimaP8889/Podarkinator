//
//  PresentsQuestionManager.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 06.05.2023.
//

import Foundation
final class PresentsQuestionManager {
    static var shared = PresentsQuestionManager()
    
    private init() {}
    
    func question(for parameters: Parameters) -> Question? {
        let questions = PresentsQuestionData()
        let presentsManager = PresentsManager.shared
        
        let questionString = questions.checkDetails
        guard let present = presentsManager.questionPresent(for: parameters) else {
            return nil
        }
        return Question(body: .present(text: questionString, present: present))
    }
}

struct PresentsQuestionData {
    let checkDetails = "Посмотреть подробнее?"
}
