//
//  TCColorConfig.swift
//  ThemeColor
//
//  Created by KyleRuan on 2018/1/8.
//  Copyright © 2018年 KyleRuan. All rights reserved.
//

import Foundation

public enum ThemeType:Int {
    case themeDay = 0
    case themeNight
}

// default work with kDefaultColorList
// call ThemeManager.sharedManager.setThemeColorList to set color config
public enum TCColorName:Int {
    case ColorNameRed = 0
    case ColorNameBlue
}


let kDefaultColorList:[[String]] = [
    [ "ee1a1a", "892323"],
    [ "1b88ee", "144e84"]
]




