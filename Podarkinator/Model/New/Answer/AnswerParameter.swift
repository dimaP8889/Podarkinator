//
//  AnswerParameter.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 01.06.2023.
//

import Foundation

enum AnswerParameter {
    case name
    case age
    case reason(PresentReason)
    case budget
    case sex(PersonSex)
    case cook(PersonCook)
    case travel(PersonTravel)
    case makePhoto(PersonMakePhoto)
    case makeMusic(PersonMakeMusic)
    case read(PersonRead)
    case doSport(PersonDoSport)
    case paint(PersonPaint)
    case chillAtHome(PersonChillAtHome)
    case playBoardGames(PersonPlayBoardgames)
    case ownPets(PersonOwnPets)
    case playVideoGames(PersonPlayVideogames)
    case handcraft(PersonHandcraft)
    case drinkAlcohol(PersonDrinkAlcohol)
    case growingPlants(PersonGrowingPlants)
    case watchMovies(PersonWatchMovies)
}

struct CustomAnswer<T> {
    let value: T
}
