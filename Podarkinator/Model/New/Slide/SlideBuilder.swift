//
//  SlideBuilder.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 02.06.2023.
//

import Foundation

final class SlideBuilder {
    private var answersFabric = AnswersFabric()
    private var questionsFabric = QuestionFabric()
    private let slideNumberManagment = SlideNumberManager()
    private var randomInterests = [Int]()
    
    init() {
        randomInterests = Int.getUniqueRandomNumbers(min: 1, max: 15, count: 7)
        answersFabric.setRandomInterests(array: randomInterests)
        questionsFabric.setRandomQuestions(array: randomInterests)
    }
    
    func next(for person: Person) -> Slide {
        let slideNumber = slideNumberManagment.next()
        let answers = answersFabric.answer(with: slideNumber, for: person)
        let question = questionsFabric.answer(with: slideNumber, for: person)
        return .init(type: .characteristics(question: question, answers: answers))
    }
}

extension Int {
    static func getUniqueRandomNumbers(min: Int, max: Int, count: Int) -> [Int] {
        var set = Set<Int>()
        while set.count < count {
            set.insert(Int.random(in: min...max))
        }
        return Array(set)
    }
}
