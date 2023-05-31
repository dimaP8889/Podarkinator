//
//  Present.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 01.05.2023.
//

import Foundation

struct Present: Identifiable, Equatable {
    let id = UUID()
    
    let image: String
    let link: String
    
    init(image: String, link: String) {
        self.image = image
        self.link = link
    }
}

