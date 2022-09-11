//  Color + Helper.swift
//  Last Update by Holger Hinzberg on 14.10.21.

import SwiftUI

extension Color {
    
    public static func randomColor() -> Color
    {
        let redCol = Double(arc4random_uniform(255)) / 255.0
        let greenCol = Double(arc4random_uniform(255)) / 255.0
        let blueCol = Double(arc4random_uniform(255)) / 255.0
        return Color(red: redCol, green: greenCol, blue: blueCol, opacity: 1.0)
    }
    
    public static func fromRGB(r: Double, g:Double, b:Double) -> Color {
        return Color(
            red: Double(r / 255.0),
            green: Double(g / 255.0),
            blue: Double(b / 255.0),
            opacity: 1.0)
    }
    
    // Creates a UIColor from a Hex string.
    public static func colorWithHexString (hex:String) -> Color
    {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#"))
        {
            //cString = cString.substring(from: cString.index(cString.startIndex, offsetBy: 1))
            cString = String(cString[...cString.index(cString.startIndex, offsetBy: 1)])
        }
        
        if (cString.count   != 6)
        {
            return Color.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return Color(
            red: Double((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: Double((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: Double(rgbValue & 0x0000FF) / 255.0,
            opacity: 1.0)
    }
    
    public static func veryLightGrayColor()->Color
    {
        return Color(red: 0.98, green: 0.98, blue: 0.98, opacity: 1.0)
    }
    
    public static func customRedColor()->Color
    {
        return Color(red: 1.0, green: 0.22, blue: 0.22, opacity: 1.0)
    }
    
    public static func customOrangeColor()->Color
    {
        return Color(red: 1.0, green: 0.58, blue: 0.21, opacity: 1.0)
    }
    
    public static func customYellowColor()->Color
    {
        return Color(red: 1.0, green: 0.79, blue: 0.28, opacity: 1.0)
    }
    
    public static func customGreenColor()->Color
    {
        return Color(red: 0.27, green: 0.85, blue: 0.46, opacity: 1.0)
    }
    
    public static func customLightBlueColor()->Color
    {
        return Color(red: 0.18, green: 0.67, blue: 0.84, opacity: 1.0)
    }
    
    public static func customDarkBlueColor()->Color
    {
        return Color(red: 0.0, green: 0.49, blue: 0.96, opacity: 1.0)
    }
    
    public static func customPurpleColor()->Color
    {
        return Color(red: 0.35, green: 0.35, blue: 0.81, opacity: 1.0)
    }
    
    public static func customPinkColor()->Color
    {
        return Color(red: 1.0, green: 0.17, blue: 0.34, opacity: 1.0)
    }
    
    public static func customDarkGrayColor()->Color
    {
        return Color(red: 0.56, green: 0.56, blue: 0.56, opacity: 1.0)
    }
    
    public static func customLightGrayColor()->Color
    {
        return Color(red: 0.78, green: 0.78, blue: 0.78, opacity: 1.0)
    }
    
    public static func lightTransparentBlueColor()->Color
    {
        return Color(red: 0.7, green: 0.7, blue: 1.0, opacity: 0.1)
    }
    
    public static func lightCyanColor()->Color
    {
        return Color(red: 0.8, green: 1.0, blue: 1.0, opacity: 1.0)
    }
    
    public static func lightPinkColor()->Color
    {
        return Color(red: 1.0, green: 0.69, blue: 0.92, opacity: 1.0)
    }
    
    public static var skyBlue : Color {
        return Color.fromRGB(r: 130, g: 204, b: 255)
    }
    
    public static var lightBlue : Color {
        return Color.fromRGB(r: 154, g: 203, b: 255)
    }
    
    public static var cocoaBlue : Color {
        return Color.fromRGB(r: 82, g: 94, b: 145)
    }

    public static var cocoaLightBlue : Color {
        return Color.fromRGB(r: 222, g: 229, b: 246)
    }
}
