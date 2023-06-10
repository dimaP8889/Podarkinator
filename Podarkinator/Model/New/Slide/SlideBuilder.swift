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
        let question = questionsFabric.question(with: slideNumber, for: person)
        
        switch slideNumber.stage {
        case .portrait:
            if slideNumber.number == 1 {
                return .init(type: .intro(
                    topText: "Привет!",
                    bottomText: "Меня зовут\n Подаркинатор",
                    question: question,
                    answers: answers
                ))
            }
            if slideNumber.number == 2 {
                return .init(type: .intro(
                    topText: "Моя цель - помогать тебе",
                    bottomText: "Помогать с выбором\n подарка для человека",
                    question: question,
                    answers: answers
                ))
            }
            let customInput: CustomInput? = {
                switch slideNumber.number {
                case 3:     return .name
                case 4:     return .age
                case 6:     return .budget
                default:    return nil
                }
            }()
            return .init(type: .characteristics(question: question, customInput: customInput, answers: answers))
        case .interests:
            return .init(type: .characteristics(question: question, customInput: nil, answers: answers))
        case .present:
            return .init(type: .characteristics(question: question, customInput: nil, answers: answers))
        }
    }
}

private extension Int {
    static func getUniqueRandomNumbers(min: Int, max: Int, count: Int) -> [Int] {
        var set = Set<Int>()
        while set.count < count {
            set.insert(Int.random(in: min...max))
        }
        return Array(set)
    }
}
