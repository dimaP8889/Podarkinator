//
//  SlideNumberManager.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 01.06.2023.
//

import Foundation

final class SlideNumberManager {
    private var currentSlideNumber: Int = 0

    func next() -> SlideNumber {
        currentSlideNumber += 1
        if currentSlideNumber < 13 {
            return .init(number: currentSlideNumber, stage: .portrait)
        } else if currentSlideNumber > 12 && currentSlideNumber < 21 {
            return .init(number: currentSlideNumber - 12, stage: .interests)
        } else if currentSlideNumber > 20 {
            return .init(number: currentSlideNumber, stage: .present)
        }
        return .init(number: 0, stage: .interests)
    }
}

struct SlideNumber {
    let number: Int
    let stage: SlideStage
}

enum SlideStage {
    case portrait
    case interests
    case present
}
