//
//  AnswersFabric.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 02.06.2023.
//

import Foundation

struct AnswersFabric {
    private var interestsAnswersDictionary = [Int:Int]()
    
    func answer(with slideNumber: SlideNumber, for person: Person) -> [NewAnswer] {
        let stage = slideNumber.stage
        switch stage {
        case .portrait:
            return portraitAnswer(with: slideNumber.number, for: person)
        case .interests:
            return interestsAnswer(for: slideNumber.number)
        case .present:
            return []
        }
    }
    
    mutating func setRandomInterests(array: [Int]) {
        let number = [1, 2, 3, 4, 5, 6, 7]
        var zip = zip(array, number)
        interestsAnswersDictionary = [:]
        zip.forEach { (question, number) in
            interestsAnswersDictionary[number] = question
        }
        interestsAnswersDictionary[8] = 16
    }
}

// MARK: - Private
private extension AnswersFabric {
    func portraitAnswer(with slideNumber: Int, for person: Person) -> [NewAnswer] {
        switch slideNumber {
        case 1, 2:
            return [PortraitAnswers.okay]
        case 3:
            return [PortraitAnswers.okayName]
        case 4:
            return [PortraitAnswers.okayAge]
        case 5:
            return [
                PortraitAnswers.birthdayReason,
                PortraitAnswers.professionalReason,
                PortraitAnswers.sesonReason
            ]
        case 6:
            return [PortraitAnswers.okayBudget]
        case 7:
            return [
                PortraitAnswers.maleSex,
                PortraitAnswers.femaleSex
            ]
        case 8:
            var answers = person.sex == .male ? [PortraitAnswers.whoBoyfriend] : [PortraitAnswers.whoGirlfriend]
            answers.append(PortraitAnswers.whoFriend)
            answers.append(PortraitAnswers.whoFamily)
            answers.append(PortraitAnswers.whoCoworker)
            return answers
        case 9:
            return [
                PortraitAnswers.temperamentAngry,
                PortraitAnswers.temperamentPokerface,
                PortraitAnswers.temperamentFunny
            ]
        case 10:
            return [
                PortraitAnswers.locationMountains,
                PortraitAnswers.locationCity,
                PortraitAnswers.locationForest,
                PortraitAnswers.locationBeach
            ]
        case 11:
            return [
                PortraitAnswers.brainRacio,
                PortraitAnswers.brainBoth,
                PortraitAnswers.brainEmo,
            ]
        case 12:
            return [PortraitAnswers.okay]
        default:
            return []
        }
    }
    
    func interestsAnswer(for slideNumber: Int) -> [NewAnswer] {
        let question = interestsAnswersDictionary[slideNumber]
        switch question {
        case 1:
            return [
                InterestsAnswers.cookingYes,
                InterestsAnswers.cookingNo,
                InterestsAnswers.cookingSometimes
            ]
        case 2:
            return [
                InterestsAnswers.travelYes,
                InterestsAnswers.travelNo,
                InterestsAnswers.travelSometimes
            ]
        case 3:
            return [
                InterestsAnswers.photographyYes,
                InterestsAnswers.photographyNo,
                InterestsAnswers.photographySometimes
            ]
        case 4:
            return [
                InterestsAnswers.musicGuitar,
                InterestsAnswers.musicDrums,
                InterestsAnswers.musicSaxophone,
                InterestsAnswers.musicNo
            ]
        case 5:
            return [
                InterestsAnswers.readsFantasy,
                InterestsAnswers.readsHistorical,
                InterestsAnswers.readsRomantic,
                InterestsAnswers.readsOnline
            ]
        case 6:
            return [
                InterestsAnswers.sportsBall,
                InterestsAnswers.sportsRocket,
                InterestsAnswers.sportsCycling,
                InterestsAnswers.sportsCycling
            ]
        case 7:
            return [
                InterestsAnswers.painitingYes,
                InterestsAnswers.painitingNo,
                InterestsAnswers.painitingOccasionally
            ]
        case 8:
            return [
                InterestsAnswers.homeComfortYes,
                InterestsAnswers.homeComfortNo,
                InterestsAnswers.homeComfortNeutral
            ]
        case 9:
            return [
                InterestsAnswers.boardGamesYes,
                InterestsAnswers.boardGamesNo,
                InterestsAnswers.boardGamesOccasionally
            ]
        case 10:
            return [
                InterestsAnswers.hasDog,
                InterestsAnswers.hasCat,
                InterestsAnswers.hasAnotherPet,
                InterestsAnswers.hasNoPets
            ]
        case 11:
            return [
                InterestsAnswers.videoGamesYes,
                InterestsAnswers.videoGamesNo,
                InterestsAnswers.videoGamesOccasionally
            ]
        case 12:
            return [
                InterestsAnswers.craftsYes,
                InterestsAnswers.craftsNo,
                InterestsAnswers.craftsOccasionally
            ]
        case 13:
            return [
                InterestsAnswers.alcoholLight,
                InterestsAnswers.alcoholMedium,
                InterestsAnswers.alcoholStrong,
                InterestsAnswers.alcoholNo
            ]
        case 14:
            return [
                InterestsAnswers.plantsYes,
                InterestsAnswers.plantsNo,
                InterestsAnswers.plantsOccasionally
            ]
        case 15:
            return [
                InterestsAnswers.cinephileYes,
                InterestsAnswers.cinephileNo,
                InterestsAnswers.cinephileMaybe
            ]
        case 16:
            return [
                InterestsAnswers.okay
            ]
        default:
            return []
        }
    }
}

private struct PortraitAnswers {
    static let okay = NewAnswer(image: "", text: "Окей", parameter: nil)
    static let okayName = NewAnswer(image: "", text: "Окей", parameter: .name)
    static let okayAge = NewAnswer(image: "", text: "Окей", parameter: .age)
    static let okayBudget = NewAnswer(image: "", text: "Окей", parameter: .budget)
    
    static let birthdayReason = NewAnswer(image: "", text: "День рождения", parameter: .reason(.birthday))
    static let professionalReason = NewAnswer(image: "", text: "Профессиональный праздник", parameter: .reason(.professional))
    static let sesonReason = NewAnswer(image: "", text: "Сезонный праздник", parameter: .reason(.season))
    
    static let maleSex = NewAnswer(image: "", text: "Мужчина", parameter: .sex(.male))
    static let femaleSex = NewAnswer(image: "", text: "Женщина", parameter: .sex(.female))
    
    static let whoBoyfriend = NewAnswer(image: "", text: "Парень", parameter: nil)
    static let whoGirlfriend = NewAnswer(image: "", text: "Девушка", parameter: nil)
    static let whoFriend = NewAnswer(image: "", text: "Друг", parameter: nil)
    static let whoFamily = NewAnswer(image: "", text: "Родственник", parameter: nil)
    static let whoCoworker = NewAnswer(image: "", text: "Коллега", parameter: nil)
    
    static let temperamentAngry = NewAnswer(image: "", text: "Вспыльчивый", parameter: nil)
    static let temperamentPokerface = NewAnswer(image: "", text: "Спокойный", parameter: nil)
    static let temperamentFunny = NewAnswer(image: "", text: "Весельчак", parameter: nil)
    
    static let locationMountains = NewAnswer(image: "", text: "Горы", parameter: nil)
    static let locationCity = NewAnswer(image: "", text: "Город", parameter: nil)
    static let locationForest = NewAnswer(image: "", text: "Лес", parameter: nil)
    static let locationBeach = NewAnswer(image: "", text: "Пляж", parameter: nil)
    
    static let brainEmo = NewAnswer(image: "", text: "Эмоциональный", parameter: nil)
    static let brainRacio = NewAnswer(image: "", text: "Рациональный", parameter: nil)
    static let brainBoth = NewAnswer(image: "", text: "И то и то", parameter: nil)
}

private struct InterestsAnswers {
    static let cookingYes = NewAnswer(image: "", text: "Да", parameter: .cook(.yes))
    static let cookingNo = NewAnswer(image: "", text: "Неа", parameter: .cook(.no))
    static let cookingSometimes = NewAnswer(image: "", text: "Иногда", parameter: .cook(.sometimes))
    
    static let travelYes = NewAnswer(image: "", text: "Очень", parameter: .travel(.yes))
    static let travelNo = NewAnswer(image: "", text: "Нет", parameter: .travel(.no))
    static let travelSometimes = NewAnswer(image: "", text: "Иногда", parameter: .travel(.sometimes))
    
    static let photographyYes = NewAnswer(image: "", text: "Да", parameter: .makePhoto(.yes))
    static let photographyNo = NewAnswer(image: "", text: "Нет", parameter: .makePhoto(.no))
    static let photographySometimes = NewAnswer(image: "", text: "Иногда", parameter: .makePhoto(.sometimes))
    
    static let musicGuitar = NewAnswer(image: "", text: "Гитара", parameter: .makeMusic(.guitar))
    static let musicDrums = NewAnswer(image: "", text: "Ударные", parameter: .makeMusic(.drum))
    static let musicSaxophone = NewAnswer(image: "", text: "Духовые", parameter: .makeMusic(.another))
    static let musicNo = NewAnswer(image: "", text: "Не играет", parameter: .makeMusic(.no))
    
    static let readsFantasy = NewAnswer(image: "", text: "Фантастику", parameter: .read(.fantasy))
    static let readsHistorical = NewAnswer(image: "", text: "Историческое", parameter: .read(.historical))
    static let readsRomantic = NewAnswer(image: "", text: "Романтическое", parameter: .read(.lovestory))
    static let readsOnline = NewAnswer(image: "", text: "Интернет", parameter: .read(.internet))
    
    static let sportsBall = NewAnswer(image: "", text: "C мячом", parameter: .doSport(.ball))
    static let sportsRocket = NewAnswer(image: "", text: "С ракеткой", parameter: .doSport(.rocket))
    static let sportsCycling = NewAnswer(image: "", text: "Вело", parameter: .doSport(.bicycle))
    static let sportsOther = NewAnswer(image: "", text: "Другое", parameter: .doSport(.another))
    
    static let painitingYes = NewAnswer(image: "", text: "Да", parameter: .paint(.yes))
    static let painitingNo = NewAnswer(image: "", text: "Нет", parameter: .paint(.no))
    static let painitingOccasionally = NewAnswer(image: "", text: "Периодически", parameter: .paint(.sometimes))
    
    static let homeComfortYes = NewAnswer(image: "", text: "Очень", parameter: .chillAtHome(.yes))
    static let homeComfortNo = NewAnswer(image: "", text: "Неа", parameter: .chillAtHome(.no))
    static let homeComfortNeutral = NewAnswer(image: "", text: "Как все", parameter: .chillAtHome(.sometimes))
    
    static let boardGamesYes = NewAnswer(image: "", text: "Да", parameter: .playBoardGames(.yes))
    static let boardGamesNo = NewAnswer(image: "", text: "Нет", parameter: .playBoardGames(.no))
    static let boardGamesOccasionally = NewAnswer(image: "", text: "Бывает", parameter: .playBoardGames(.sometimes))
    
    static let hasDog = NewAnswer(image: "", text: "Собака", parameter: .ownPets(.dog))
    static let hasCat = NewAnswer(image: "", text: "Кошка", parameter: .ownPets(.cat))
    static let hasAnotherPet = NewAnswer(image: "", text: "Экзотика", parameter: .ownPets(.another))
    static let hasNoPets = NewAnswer(image: "", text: "Нет", parameter: .ownPets(.no))
    
    static let videoGamesYes = NewAnswer(image: "", text: "Да", parameter: .playVideoGames(.yes))
    static let videoGamesNo = NewAnswer(image: "", text: "Нет", parameter: .playVideoGames(.no))
    static let videoGamesOccasionally = NewAnswer(image: "", text: "Бывает", parameter: .playVideoGames(.sometimes))
    
    static let craftsYes = NewAnswer(image: "", text: "Да", parameter: .handcraft(.yes))
    static let craftsNo = NewAnswer(image: "", text: "Нет", parameter: .handcraft(.no))
    static let craftsOccasionally = NewAnswer(image: "", text: "Иногда", parameter: .handcraft(.sometimes))
    
    static let alcoholLight = NewAnswer(image: "", text: "Легкий", parameter: .drinkAlcohol(.light))
    static let alcoholMedium = NewAnswer(image: "", text: "Средний", parameter: .drinkAlcohol(.medium))
    static let alcoholStrong = NewAnswer(image: "", text: "Тяжелый", parameter: .drinkAlcohol(.strong))
    static let alcoholNo = NewAnswer(image: "", text: "Нет", parameter: .drinkAlcohol(.no))
    
    static let plantsYes = NewAnswer(image: "", text: "Да", parameter: .growingPlants(.yes))
    static let plantsNo = NewAnswer(image: "", text: "Неа", parameter: .growingPlants(.no))
    static let plantsOccasionally = NewAnswer(image: "", text: "Не знаю", parameter: .growingPlants(.sometimes))
    
    static let cinephileYes = NewAnswer(image: "", text: "Еще как", parameter: .watchMovies(.yes))
    static let cinephileNo = NewAnswer(image: "", text: "Нет", parameter: .watchMovies(.no))
    static let cinephileMaybe = NewAnswer(image: "", text: "Возможно", parameter: .watchMovies(.sometimes))
    
    static let okay = NewAnswer(image: "", text: "Окей", parameter: nil)
}
