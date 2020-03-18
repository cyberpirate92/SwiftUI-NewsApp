//
//  Utils.swift
//  News
//
//  Created by Ravi Theja on 18/03/20.
//  Copyright © 2020 Idlebrains. All rights reserved.
//

import Foundation

class Utils {
    public static func getFormattedDateString(someDate: Date?) -> String {
        if (someDate == nil) {
            return "Unknown"
        }
        
        let minute = 60.0, hour = 3600.0
        let now = Date(), difference = now.timeIntervalSince(someDate!)
        let formatter = DateFormatter()
        let calendar = Calendar(identifier: .gregorian)
        
        if difference < minute {
            return "Few seconds ago"
        } else if difference < hour {
            return "Few minutes ago"
        }
        
        if (calendar.isDateInToday(someDate!)) {
            formatter.dateFormat = "HH:mm"
            return "Today " + formatter.string(from: someDate!)
        } else if (calendar.isDateInYesterday(someDate!)) {
            formatter.dateFormat = "HH:mm"
            return "Yesterday " + formatter.string(from: someDate!)
        }
        
        formatter.dateFormat = "dd MMM HH:mm"
        return formatter.string(from: someDate!)
    }
}
