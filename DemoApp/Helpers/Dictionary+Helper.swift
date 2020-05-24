// Copyright © 2020 Shady Kahaleh. All rights reserved.

import Foundation

extension Dictionary{
    func prettyPrint(){
           self.forEach { print("\($0): \($1)") }
       }
}
