//
//  Date.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 28/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import Foundation

extension Date {
    static let iso8601Formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        return formatter
    }()

    static func timeStringSince(fromConverted date: Date) -> String {
        let diffDates = NSCalendar.current.dateComponents([.day, .hour, .second], from: date, to: Date())

        if let week = diffDates.day, week > 7 {
            return "\(week / 7)w"
        } else if let day = diffDates.day, day > 0 {
            return "\(day)d"
        } else if let hour = diffDates.hour, hour > 0 {
            return "\(hour)h"
        } else if let second = diffDates.second, second > 0 {
            return "\(second)s"
        } else if let zero = diffDates.second, zero == 0 {
            return "1s"
        } else {
            return "ERROR"
        }
    }
}
