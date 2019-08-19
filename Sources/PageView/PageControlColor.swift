//
//  PageControlColor.swift
//  PageView
//
//  Created by Michael Salmon on 2019-08-18.
//

import Foundation
#if canImport(UIKit)
import UIKit

fileprivate extension UIColor {
    // init with int values
    convenience init(_ r: Int, _ g: Int, _ b: Int) {
        func cvt(_ i: Int) -> CGFloat { CGFloat(i)/255.0 }

        self.init(red: cvt(r), green: cvt(g), blue: cvt(b), alpha: 1.0)
    }
}

enum PageControlColor {
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
        case .black:        return UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        case .blue:         return UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
        case .custom(let c):return c
        case .gray(let i):  return UIColor(white: i, alpha: 1.0)
        case .green:        return UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
        case .intRGB(let r, let g, let b):
                            return UIColor(r, g, b)
        case .red:          return UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        case .white:        return UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
}

#endif
