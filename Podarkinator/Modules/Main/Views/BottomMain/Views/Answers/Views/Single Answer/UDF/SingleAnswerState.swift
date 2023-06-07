//
//  SingleAnswerState.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 06.06.2023.
//
import Foundation

struct SingleAnswerState: Equatable, Identifiable {
    var id = UUID()
    
    let answer: Answer
}

