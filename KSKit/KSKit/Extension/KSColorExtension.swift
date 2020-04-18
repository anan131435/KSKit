//
//  KSColorExtension.swift
//  KSKit
//
//  Created by 韩志峰 on 2020/4/18.
//  Copyright © 2020 www.KS.net. All rights reserved.
//

import Foundation
import AppKit
extension NSColor{
    /// 根据rgb返回颜色
    public final class func colorRGBA(red: CGFloat , green: CGFloat , blue: CGFloat , alpha: CGFloat = 1.0) -> NSColor{
        return NSColor.init(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
    
    /// 根据颜色十六进制代码获取颜色
    /// - Parameter hex: 十六进制代码值
    /// - Parameter alpha: 透明度
    public final class func colorWithHex(_ hex : String, alpha: CGFloat = 1.0) -> NSColor{
        var hexColor = hex
        hexColor = hexColor.replacingOccurrences(of: " ", with: "")
        if(hexColor.hasPrefix("#")){
            hexColor = String(hexColor.suffix(from: hexColor.index(hexColor.startIndex, offsetBy: 1)))
        }
        let rStr = String(hexColor[hexColor.startIndex ..< hexColor.index(hexColor.startIndex, offsetBy: 2)])
        let gStr = String(hexColor[hexColor.index(hexColor.startIndex, offsetBy: 2) ..< hexColor.index(hexColor.startIndex, offsetBy: 4)])
        let bStr = String(hexColor[hexColor.index(hexColor.startIndex, offsetBy: 4) ..< hexColor.index(hexColor.startIndex, offsetBy: 6)])
        var r = uint()
        var g = uint()
        var b = uint()
        Scanner.init(string: rStr).scanHexInt32(&r)
        Scanner.init(string: gStr).scanHexInt32(&g)
        Scanner.init(string: bStr).scanHexInt32(&b)
        let color : NSColor = NSColor.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpha)
        return color;
    }
}
