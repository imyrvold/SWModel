//
//  File.swift
//  
//
//  Created by Ivan C Myrvold on 13/09/2020.
//

import Foundation

extension DateFormatter {
    public static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
//        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}
