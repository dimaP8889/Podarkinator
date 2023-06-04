//
//  QuestionFabric.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 04.06.2023.
//

import Foundation

struct QuestionFabric {
    private var interestsQuestionsDictionary = [Int:Int]()
    
    func answer(with slideNumber: SlideNumber, for person: Person) -> String {
        let stage = slideNumber.stage
        switch stage {
        case .portrait:
            return portraitQuestion(with: slideNumber.number, for: person)
        case .interests:
            return interestsQuestion(with: slideNumber.number, for: person)
        case .present:
            return ""
        }
    }
    
    mutating func setRandomQuestions(array: [Int]) {
        let number = [1, 2, 3, 4, 5, 6, 7]
        let zip = zip(array, number)
        interestsQuestionsDictionary = [:]
        zip.forEach { (question, number) in
            interestsQuestionsDictionary[number] = question
        }
        interestsQuestionsDictionary[8] = 16
    }
}

// MARK: - Private
private extension QuestionFabric {
    func portraitQuestion(with slideNumber: Int, for person: Person) -> String {
        switch slideNumber {
        case 1:
            return PortraitQuestions.hello
        case 2:
            return PortraitQuestions.goal
        case 3:
            return PortraitQuestions.name
        case 4:
            return PortraitQuestions.age
        case 5:
            return PortraitQuestions.reason
        case 6:
            return PortraitQuestions.budget
        case 7:
            let question = PortraitQuestions.sex
            let name = person.name
            let finalQuestion = question.replacingOccurrences(of: "%@", with: name)
            return finalQuestion
        case 8:
            let question = PortraitQuestions.relationship
            let name = person.name
            let finalQuestion = question.replacingOccurrences(of: "%@", with: name)
            return finalQuestion
        case 9:
            let question = PortraitQuestions.temperament
            let sex = person.sex == .male ? "него" : "нее"
            let finalQuestion = question.replacingOccurrences(of: "%@", with: sex)
            return finalQuestion
        case 10:
            let question = PortraitQuestions.location
            let sex = person.sex == .male ? "он" : "она"
            let finalQuestion = question.replacingOccurrences(of: "%@", with: sex)
            return finalQuestion
        case 11:
            return PortraitQuestions.brain
        case 12:
            let question = PortraitQuestions.final
            let sex = person.sex == .male ? "его" : "ее"
            let finalQuestion = question.replacingOccurrences(of: "%@", with: sex)
            return finalQuestion
        default:
            return ""
        }
    }
    
    func interestsQuestion(with slideNumber: Int, for person: Person) -> String {
        let question = interestsQuestionsDictionary[slideNumber]
        switch question {
        case 1:
            return InterestsQuestions.cooking
        case 2:
            let question = InterestsQuestions.travelling
            let sex = person.sex == .male ? "он" : "она"
            let finalQuestion = question.replacingOccurrences(of: "%@", with: sex)
            return finalQuestion
        case 3:
            let question = InterestsQuestions.photo
            let sex = person.sex == .male ? "он" : "она"
            let finalQuestion = question.replacingOccurrences(of: "%@", with: sex)
            return finalQuestion
        case 4:
            let question = InterestsQuestions.music
            let name = person.name
            let finalQuestion = question.replacingOccurrences(of: "%@", with: name)
            return finalQuestion
        case 5:
            let question = InterestsQuestions.reading
            let name = person.name
            let finalQuestion = question.replacingOccurrences(of: "%@", with: name)
            return finalQuestion
        case 6:
            let question = InterestsQuestions.sport
            let name = person.name
            let finalQuestion = question.replacingOccurrences(of: "%@", with: name)
            return finalQuestion
        case 7:
            let question = InterestsQuestions.drawing
            let sex = person.sex == .male ? "он" : "она"
            let finalQuestion = question.replacingOccurrences(of: "%@", with: sex)
            return finalQuestion
        case 8:
            let question = InterestsQuestions.homeComfort
            let sex = person.sex == .male ? "он" : "она"
            let finalQuestion = question.replacingOccurrences(of: "%@", with: sex)
            return finalQuestion
        case 9:
            return InterestsQuestions.boardGames
        case 10:
            let question = InterestsQuestions.pets
            let sex = person.sex == .male ? "него" : "нее"
            let finalQuestion = question.replacingOccurrences(of: "%@", with: sex)
            return finalQuestion
        case 11:
            let question = InterestsQuestions.videoGames
            let name = person.name
            let finalQuestion = question.replacingOccurrences(of: "%@", with: name)
            return finalQuestion
        case 12:
            let question = InterestsQuestions.craft
            let name = person.name
            let finalQuestion = question.replacingOccurrences(of: "%@", with: name)
            return finalQuestion
        case 13:
            let question = InterestsQuestions.alcohol
            let name = person.name
            let finalQuestion = question.replacingOccurrences(of: "%@", with: name)
            return finalQuestion
        case 14:
            let question = InterestsQuestions.grow
            let sex = person.sex == .male ? "он" : "она"
            let finalQuestion = question.replacingOccurrences(of: "%@", with: sex)
            return finalQuestion
        case 15:
            let question = InterestsQuestions.cinemaphil
            let sex = person.sex == .male ? "он" : "она"
            let finalQuestion = question.replacingOccurrences(of: "%@", with: sex)
            return finalQuestion
        case 16:
            return InterestsQuestions.final
        default:
            return ""
        }
    }
}

private struct PortraitQuestions {
    static let hello = "Я искусственный\n интеллект"
    static let goal = "Давай попробуем"
    static let name = "Как зовут человека?"
    static let age = "Сколько ему лет?\n Хотя бы примерно"
    static let reason = "По какому поводу\n подарок?"
    static let budget = "Бюджет на подарок?"
    static let sex = "Какого %@ пола?"
    static let relationship = "Кем тебе приходятся\n %@?"
    static let temperament = "Какой у %@\n темперамент?"
    static let location = "Что %@ любит\n больше?"
    static let brain = "Эмоциональный или\n рациональный человек?"
    static let final = "Я составил примерный\n портрет человека\n Давай поговорим о\n %@ увлечениях"
}

private struct InterestsQuestions {
    static let cooking = "Любит ли готовить?"
    static let travelling = "%@\n путешественник?"
    static let photo = "%@ - фотограф?"
    static let music = "Играет ли %name% на\n музыкальных\n инструментах?"
    static let reading = "Какую литературу читает %@?"
    static let sport = "Каким спортом\n предпочитает\n заниматься %@?"
    static let drawing = "%@ любит рисовать?"
    static let homeComfort = "%@ любит домашний\n уют, верно?"
    static let boardGames = "Как насчет настольных\n игр?"
    static let pets = "Если у %@ домашние\n животные?"
    static let videoGames = "%@ играет в видео\n игры?"
    static let craft = "Возможно %@\n любит работать руками,\n ремесло, рукоделие.\n Верно?"
    static let alcohol = "Ценит ли %@\n хороший алкоголь?"
    static let grow = "Выращивает ли %@\n растения? Дом или в саду"
    static let cinemaphil = "Можно ли назвать %@\n киноманом?"
    static let final = "Основываясь на\n портрете и интересах\n человека, я нашел\n несколько вариантов\n подарка\n\n Показать?"
}
