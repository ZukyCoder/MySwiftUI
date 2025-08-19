//
//  Date+Extension.swift
//  MySwiftUI
//
//  Created by Mario Andres Heberthardt Marchant on 19/8/25.
//
import Foundation

/// Extension for DateFormatter that provides standard formatters for the app
extension DateFormatter {
    /// Date formatter configured for JSON date strings in "yyyy-MM-dd" format
    ///
    /// This formatter is used to parse date strings from API responses and format dates
    /// when sending data to the API.
    ///
    /// Example: "2023-08-19"
    static let JSONFormatter: DateFormatter = {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        return format
    }()
}
