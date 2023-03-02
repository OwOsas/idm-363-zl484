//
//  ColorToValue.swift
//  idm-363-zl484
//
//  Created by Zhengtian Li on 2/23/23.
//

import SwiftUI
import UIKit

func arrClrToHex(ColorArr: [UIColor]) -> [String]? {
    var strArr: [String]?
    for color in ColorArr{
        strArr?.append(toHex(color:Color(uiColor: color)) ?? "<Cannot Convert>")
    }
    
    return strArr
}


func toHex(color: Color) -> String? {
    guard let components = color.cgColor?.components, components.count >= 3 else {
        return nil
    }
    let r = Float(components[0])
    let g = Float(components[1])
    let b = Float(components[2])
    var a = Float(1.0)
    
    if components.count >= 4 {
        a = Float(components[3])
    }
    
    if a != Float(1.0) {
        return String(format: "%02lX%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255), lroundf(a * 255))
    } else {
        return String(format: "%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
    }
}
