//
//  Modifiers.swift
//  Apply-Improving
//
//  Created by Adriano Rodrigues Vieira on 24/02/21.
//  Contain modifiers for animation purposes and others
//
//

import Foundation
import SwiftUI

// MARK: - Modifier for shake animation
struct Shake: GeometryEffect {
    var amount: CGFloat = 5
    var shakesPerUnit = 5
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
            amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
            y: 0))
    }
}

