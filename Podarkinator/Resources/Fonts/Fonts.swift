//
//  Fonts.swift
//  Podarkinator
//
//  Created by Dmytro Pogrebniak on 06.06.2023.
//

import SwiftUI
import UIKit

extension Font {
    static func main(size: CGFloat, weight: Weight = .regular) -> Font {
        Font.custom("Montserrat", size: size)
            .weight(weight)
    }
}
