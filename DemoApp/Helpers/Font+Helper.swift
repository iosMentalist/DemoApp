// Copyright © 2020 Shady Kahaleh. All rights reserved.

import UIKit

enum FONT_SIZE : CGFloat{
    case small = 25
    case medium = 35
    case large = 45
}
extension UIFont {
    class func arabicBold(withSize size: FONT_SIZE) -> UIFont? {
        return UIFont(name: "AdobeArabic-Bold", size: size.rawValue)
    }

    class func arabicRegular(withSize size: FONT_SIZE) -> UIFont? {
        return UIFont(name: "AdobeArabic-Regular", size: size.rawValue)
    }

    class func naskhMediumFont(withSize size: FONT_SIZE) -> UIFont? {
        return UIFont(name: "AdobeNaskh-Medium", size: size.rawValue)
    }
}
