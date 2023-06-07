//
//  AnswersFabric.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 02.06.2023.
//

struct AnswersFabric {
    private var interestsAnswersDictionary = [Int:Int]()
    
    func answer(with slideNumber: SlideNumber, for person: Person) -> [Answer] {
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
        let zip = zip(array, number)
        interestsAnswersDictionary = [:]
        zip.forEach { (question, number) in
            interestsAnswersDictionary[number] = question
        }
        interestsAnswersDictionary[8] = 16
    }
}

// MARK: - Private
private extension AnswersFabric {
    func portraitAnswer(with slideNumber: Int, for person: Person) -> [Answer] {
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
                PortraitAnswers.sesonReason,
                PortraitAnswers.aniversaryReason
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
    
    func interestsAnswer(for slideNumber: Int) -> [Answer] {
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
                InterestsAnswers.sportsOther
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
    static let okay = Answer(image: "done_ic", text: "Окей", parameter: nil)
    static let okayName = Answer(image: "done_ic", text: "Окей", parameter: .name)
    static let okayAge = Answer(image: "done_ic", text: "Окей", parameter: .age)
    static let okayBudget = Answer(image: "done_ic", text: "Окей", parameter: .budget)
    
    static let birthdayReason = Answer(image: "birthday_ic", text: "День\n рождения", parameter: .reason(.birthday))
    static let professionalReason = Answer(image: "prof_ic", text: "Проф.\n праздник", parameter: .reason(.professional))
    static let sesonReason = Answer(image: "season_ic", text: "Сезонный\n праздник", parameter: .reason(.season))
    static let aniversaryReason = Answer(image: "couple_ic", text: "Годовщина", parameter: .reason(.season))
    
    static let maleSex = Answer(image: "male_ic", text: "Мужчина", parameter: .sex(.male))
    static let femaleSex = Answer(image: "female_ic", text: "Женщина", parameter: .sex(.female))
    
    static let whoBoyfriend = Answer(image: "partner_ic", text: "Парень", parameter: nil)
    static let whoGirlfriend = Answer(image: "partner_ic", text: "Девушка", parameter: nil)
    static let whoFriend = Answer(image: "friend_ic", text: "Друг", parameter: nil)
    static let whoFamily = Answer(image: "", text: "Родственник", parameter: nil)
    static let whoCoworker = Answer(image: "coworker_ic", text: "Коллега", parameter: nil)
    
    static let temperamentAngry = Answer(image: "", text: "Вспыльчивый", parameter: nil)
    static let temperamentPokerface = Answer(image: "", text: "Спокойный", parameter: nil)
    static let temperamentFunny = Answer(image: "", text: "Весельчак", parameter: nil)
    
    static let locationMountains = Answer(image: "", text: "Горы", parameter: nil)
    static let locationCity = Answer(image: "", text: "Город", parameter: nil)
    static let locationForest = Answer(image: "", text: "Лес", parameter: nil)
    static let locationBeach = Answer(image: "", text: "Пляж", parameter: nil)
    
    static let brainEmo = Answer(image: "", text: "Эмоциональный", parameter: nil)
    static let brainRacio = Answer(image: "", text: "Рациональный", parameter: nil)
    static let brainBoth = Answer(image: "", text: "И то и то", parameter: nil)
}

private struct InterestsAnswers {
    static let cookingYes = Answer(image: "", text: "Да", parameter: .cook(.yes))
    static let cookingNo = Answer(image: "", text: "Неа", parameter: .cook(.no))
    static let cookingSometimes = Answer(image: "", text: "Иногда", parameter: .cook(.sometimes))
    
    static let travelYes = Answer(image: "", text: "Очень", parameter: .travel(.yes))
    static let travelNo = Answer(image: "", text: "Нет", parameter: .travel(.no))
    static let travelSometimes = Answer(image: "", text: "Иногда", parameter: .travel(.sometimes))
    
    static let photographyYes = Answer(image: "", text: "Да", parameter: .makePhoto(.yes))
    static let photographyNo = Answer(image: "", text: "Нет", parameter: .makePhoto(.no))
    static let photographySometimes = Answer(image: "", text: "Иногда", parameter: .makePhoto(.sometimes))
    
    static let musicGuitar = Answer(image: "", text: "Гитара", parameter: .makeMusic(.guitar))
    static let musicDrums = Answer(image: "", text: "Ударные", parameter: .makeMusic(.drum))
    static let musicSaxophone = Answer(image: "", text: "Духовые", parameter: .makeMusic(.another))
    static let musicNo = Answer(image: "", text: "Не играет", parameter: .makeMusic(.no))
    
    static let readsFantasy = Answer(image: "", text: "Фантастику", parameter: .read(.fantasy))
    static let readsHistorical = Answer(image: "", text: "Историческое", parameter: .read(.historical))
    static let readsRomantic = Answer(image: "", text: "Романтическое", parameter: .read(.lovestory))
    static let readsOnline = Answer(image: "", text: "Интернет", parameter: .read(.internet))
    
    static let sportsBall = Answer(image: "", text: "C мячом", parameter: .doSport(.ball))
    static let sportsRocket = Answer(image: "", text: "С ракеткой", parameter: .doSport(.rocket))
    static let sportsCycling = Answer(image: "", text: "Вело", parameter: .doSport(.bicycle))
    static let sportsOther = Answer(image: "", text: "Другое", parameter: .doSport(.another))
    
    static let painitingYes = Answer(image: "", text: "Да", parameter: .paint(.yes))
    static let painitingNo = Answer(image: "", text: "Нет", parameter: .paint(.no))
    static let painitingOccasionally = Answer(image: "", text: "Периодически", parameter: .paint(.sometimes))
    
    static let homeComfortYes = Answer(image: "", text: "Очень", parameter: .chillAtHome(.yes))
    static let homeComfortNo = Answer(image: "", text: "Неа", parameter: .chillAtHome(.no))
    static let homeComfortNeutral = Answer(image: "", text: "Как все", parameter: .chillAtHome(.sometimes))
    
    static let boardGamesYes = Answer(image: "", text: "Да", parameter: .playBoardGames(.yes))
    static let boardGamesNo = Answer(image: "", text: "Нет", parameter: .playBoardGames(.no))
    static let boardGamesOccasionally = Answer(image: "", text: "Бывает", parameter: .playBoardGames(.sometimes))
    
    static let hasDog = Answer(image: "", text: "Собака", parameter: .ownPets(.dog))
    static let hasCat = Answer(image: "", text: "Кошка", parameter: .ownPets(.cat))
    static let hasAnotherPet = Answer(image: "", text: "Экзотика", parameter: .ownPets(.another))
    static let hasNoPets = Answer(image: "", text: "Нет", parameter: .ownPets(.no))
    
    static let videoGamesYes = Answer(image: "", text: "Да", parameter: .playVideoGames(.yes))
    static let videoGamesNo = Answer(image: "", text: "Нет", parameter: .playVideoGames(.no))
    static let videoGamesOccasionally = Answer(image: "", text: "Бывает", parameter: .playVideoGames(.sometimes))
    
    static let craftsYes = Answer(image: "", text: "Да", parameter: .handcraft(.yes))
    static let craftsNo = Answer(image: "", text: "Нет", parameter: .handcraft(.no))
    static let craftsOccasionally = Answer(image: "", text: "Иногда", parameter: .handcraft(.sometimes))
    
    static let alcoholLight = Answer(image: "", text: "Легкий", parameter: .drinkAlcohol(.light))
    static let alcoholMedium = Answer(image: "", text: "Средний", parameter: .drinkAlcohol(.medium))
    static let alcoholStrong = Answer(image: "", text: "Тяжелый", parameter: .drinkAlcohol(.strong))
    static let alcoholNo = Answer(image: "", text: "Нет", parameter: .drinkAlcohol(.no))
    
    static let plantsYes = Answer(image: "", text: "Да", parameter: .growingPlants(.yes))
    static let plantsNo = Answer(image: "", text: "Неа", parameter: .growingPlants(.no))
    static let plantsOccasionally = Answer(image: "", text: "Не знаю", parameter: .growingPlants(.sometimes))
    
    static let cinephileYes = Answer(image: "", text: "Еще как", parameter: .watchMovies(.yes))
    static let cinephileNo = Answer(image: "", text: "Нет", parameter: .watchMovies(.no))
    static let cinephileMaybe = Answer(image: "", text: "Возможно", parameter: .watchMovies(.sometimes))
    
    static let okay = Answer(image: "done_ic", text: "Окей", parameter: nil)
}
