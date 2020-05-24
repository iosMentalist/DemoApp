// Copyright © 2020 Shady Kahaleh. All rights reserved.

import UIKit

extension UIColor{

    class func color(withHexString hex: String) -> UIColor?{
        let r, g, b, a: CGFloat
        let start = hex.index(hex.startIndex, offsetBy: 1)
        let hexColor = String(hex[start...])
        if hexColor.count == 8 {
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0
            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                a = CGFloat(hexNumber & 0x000000ff) / 255
                return UIColor(red: r, green: g, blue: b, alpha: a)
            }
        }


        return nil
    }

    class func darkBordeaux() -> UIColor? {
        self.color(withHexString: "641514")
    }

    class func lightBordeaux() -> UIColor? {
        return self.color(withHexString: "851F1B")
    }

    class func sepiaColor() -> UIColor? {
        return self.color(withHexString: "FFF2E0")
    }

    class func darkBlue() -> UIColor? {
        return self.color(withHexString: "22205F")
    }

    class func lightBlue() -> UIColor? {
        return self.color(withHexString: "9494C8")
    }

    class func pink() -> UIColor? {
        return self.color(withHexString: "F59698")
    }

    class func disableButton() -> UIColor? {
        return self.color(withHexString: "A97264")

    }

}
