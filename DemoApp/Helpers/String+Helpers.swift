// Copyright © 2020 Shady Kahaleh. All rights reserved.

import Foundation
extension String {

    func toDate() ->Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateFormatter.timeZone = NSTimeZone.local
        dateFormatter.locale = NSLocale(localeIdentifier: "en") as Locale
        return dateFormatter.date(from: self)
    }

    func convertToDictionary() -> [[String: Any]]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
            } catch let error {
                debugPrint("error in coverting string to arry of dictionary \(error) ")
            }
        }
        return nil
    }

    func stripHTML() -> String{
          let str = self.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil)
          return str
      }
}
