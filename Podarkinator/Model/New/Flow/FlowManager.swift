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
    
    func next() -> MainState {
        let slider = slideBuilder.next(for: person)
        let top = TopMainState(topText: slider.type.topText, bottomText: slider.type.bottomText)
        let bottom = BottomMainState(question: slider.type.question, answers: slider.type.answers)
        return MainState(top: top, bottom: bottom)
    }
    
    func setPerson(parameter: AnswerParameter?, with customAnswer: CustomAnswer<Any>? = nil) {
        guard let parameter = parameter else { return }
        person.set(parameter, with: customAnswer)
    }
}
