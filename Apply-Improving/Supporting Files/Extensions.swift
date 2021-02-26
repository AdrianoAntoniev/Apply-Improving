//
//  Extensions.swift
//  Apply-Improving
//
//  Created by Adriano Rodrigues Vieira on 24/02/21.
//

import Foundation
import SwiftUI


// MARK: - Extension of Date, which convert ISO8061 date format in dd-MM-yyyy format string.
extension Date {
    static func convertToDayMonthYear(from iso8061DateString: String) -> String {
        
        // Memory leak but elegant way
//        let inDateFormatter = ISO8601DateFormatter()
//
//        let outDateFormatter = DateFormatter()
//        outDateFormatter.dateFormat = Formats.DATE
//        outDateFormatter.locale = Locale(identifier: Identifiers.DATE_EN)
//
//
//        if let date = inDateFormatter.date(from: iso8061String) {
//            let formattedDateString = outDateFormatter.string(from: date)
//
//            return formattedDateString
//        }
        
        // Simplest and no memory leak way, but it is workaround
        // (string: 2021-02-26T15:40:50Z)
        let dateConvertedString = iso8061DateString.prefix(10) // 2021-02-26
                
        let dayString = dateConvertedString.suffix(2) // 26
        let monthString = dateConvertedString.prefix(7).suffix(2) // 2021-02, 02
        let yearString = dateConvertedString.prefix(4) // 02
        
        
        return "\(dayString)/\(monthString)/\(yearString)"
    }
}


// MARK: - Extension of Color, which creates a new color based on hex string.
extension Color {
    init(hex: String) {
            let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
            var int: UInt64 = 0
            
            Scanner(string: hex).scanHexInt64(&int)
            let alpha, red, green, blue: UInt64
            switch hex.count {
            case 3:
                (alpha, red, green, blue) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6:
                (alpha, red, green, blue) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8:
                (alpha, red, green, blue) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (alpha, red, green, blue) = (1, 1, 1, 0)
            }

            self.init(
                .sRGB,
                red: Double(red) / 255,
                green: Double(green) / 255,
                blue:  Double(blue) / 255,
                opacity: Double(alpha) / 255
            )
        }
}

