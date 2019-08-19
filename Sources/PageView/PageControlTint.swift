//
//  PageControlTint.swift
//  PageView
//
//  Created by Michael Salmon on 2019-08-18.
//

import Foundation
#if canImport(UIKit)
import UIKit

fileprivate extension UIColor {
    // init with int values
    convenience init(_ red: Int, _ green: Int, _ blue: Int) {
        func cvt(_ val: Int) -> CGFloat { CGFloat(val)/255.0 }

        self.init(red: cvt(red), green: cvt(green), blue: cvt(blue), alpha: 1.0)
    }
}

enum PageControlTint {
    case red
    case green
    case blue
    case white
    case black
    case custom(UIColor)
    case gray(CGFloat)
    case intRGB(Int, Int, Int)

    func opacity(_ alpha: CGFloat) -> UIColor { self.uicolor.withAlphaComponent(alpha) }

    var uicolor: UIColor {
        switch self {
        case .black:
            return UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        case .blue:
            return UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
        case .custom(let color):
            return color
        case .gray(let gray):
            return UIColor(white: gray, alpha: 1.0)
        case .green:
            return UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
        case .intRGB(let red, let green, let blue):
            return UIColor(red, green, blue)
        case .red:
            return UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        case .white:
            return UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
}

#endif
