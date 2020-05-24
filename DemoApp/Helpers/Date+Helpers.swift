// Copyright © 2020 Shady Kahaleh. All rights reserved.

import Foundation

extension Date {

    func isSameDayAs(date : Date) -> Bool {
        return Calendar.current.isDate(self, inSameDayAs: date)
    }

    func getAllCompenents() -> DateComponents? {
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.weekOfYear, .day, .month, .year, .weekday], from: self)
        return dateComponents
    }

    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateFormatter.timeZone = NSTimeZone.local
        dateFormatter.locale = NSLocale(localeIdentifier: "en") as Locale
        return dateFormatter.string(from: self)
    }
}
