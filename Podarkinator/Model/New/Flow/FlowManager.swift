//
//  FlowManager.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 01.06.2023.
//

import Foundation

final class FlowManager {
    private var person = Person()
    private var slideBuilder = SlideBuilder()
    
    func nextSlider() -> Slide? {
        return slideBuilder.next(for: person)
    }
    
    func setPerson(parameter: AnswerParameter?, with customAnswer: CustomAnswer<Any>? = nil) {
        guard let parameter = parameter else { return }
        person.set(parameter, with: customAnswer)
    }
}
