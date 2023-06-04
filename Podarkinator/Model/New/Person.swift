//
//  Person.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 01.06.2023.
//

import Foundation

struct Person {
    var name: String = ""
    var age: Int = 0
    var reason: PresentReason = .another
    var budget: Int = 0
    var sex: PersonSex = .female
    var cook: PersonCook = .no
    var travel: PersonTravel = .no
    var makePhoto: PersonMakePhoto = .no
    var makeMusic: PersonMakeMusic = .no
    var read: PersonRead = .internet
    var doSport: PersonDoSport = .ball
    var paint: PersonPaint = .no
    var chillAtHome: PersonChillAtHome = .no
    var playBoardGames: PersonPlayBoardgames = .no
    var ownPets: PersonOwnPets = .no
    var playVideoGames: PersonPlayVideogames = .no
    var handcraft: PersonHandcraft = .no
    var drinkAlcohol: PersonDrinkAlcohol = .no
    var growingPlants: PersonGrowingPlants = .no
    var watchMovies: PersonWatchMovies = .no
    
    mutating func set(_ parameter: AnswerParameter, with customAnswer: CustomAnswer<Any>?) {
        switch parameter {
        case .name:
            self.name = customAnswer?.value as? String ?? ""
        case .age:
            self.age = customAnswer?.value as? Int ?? 0
        case let .reason(value):
            self.reason = value
        case .budget:
            self.budget = customAnswer?.value as? Int ?? 0
        case let .sex(value):
            self.sex = value
        case let .cook(value):
            self.cook = value
        case let .travel(value):
            self.travel = value
        case let .makePhoto(value):
            self.makePhoto = value
        case let .makeMusic(value):
            self.makeMusic = value
        case let .read(value):
            self.read = value
        case let .doSport(value):
            self.doSport = value
        case let .paint(value):
            self.paint = value
        case let .chillAtHome(value):
            self.chillAtHome = value
        case let .playBoardGames(value):
            self.playBoardGames = value
        case let .ownPets(value):
            self.ownPets = value
        case let .playVideoGames(value):
            self.playVideoGames = value
        case let .handcraft(value):
            self.handcraft = value
        case let .drinkAlcohol(value):
            self.drinkAlcohol = value
        case let .growingPlants(value):
            self.growingPlants = value
        case let .watchMovies(value):
            self.watchMovies = value
        }
    }
}

enum PresentReason {
    case season
    case birthday
    case professional
    case another
}

enum PersonSex {
    case male
    case female
}

enum PersonCook {
    case yes
    case no
    case sometimes
}

enum PersonTravel {
    case yes
    case no
    case sometimes
}

enum PersonMakePhoto {
    case yes
    case no
    case sometimes
}

enum PersonMakeMusic {
    case guitar
    case drum
    case no
    case another
}

enum PersonRead {
    case fantasy
    case historical
    case lovestory
    case internet
}

enum PersonDoSport {
    case ball
    case rocket
    case bicycle
    case another
}

enum PersonPaint {
    case yes
    case no
    case sometimes
}

enum PersonChillAtHome {
    case yes
    case no
    case sometimes
}

enum PersonPlayBoardgames {
    case yes
    case no
    case sometimes
}

enum PersonOwnPets {
    case dog
    case cat
    case another
    case no
}

enum PersonPlayVideogames {
    case yes
    case no
    case sometimes
}

enum PersonHandcraft {
    case yes
    case no
    case sometimes
}

enum PersonDrinkAlcohol {
    case light
    case medium
    case strong
    case no
}

enum PersonGrowingPlants {
    case yes
    case no
    case sometimes
}

enum PersonWatchMovies {
    case yes
    case no
    case sometimes
}
