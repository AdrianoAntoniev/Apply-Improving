//
//  SettingsOpener.swift
//  Apply-Improving
//
//  Created by Adriano Rodrigues Vieira on 25/02/21.
//

import Foundation
import SwiftUI

struct SettingsOpener {
    static func open() {
        if let settingsUrl = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl)
            }
        }
    }
}
