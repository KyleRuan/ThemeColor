//
//  ThemeManager.swift
//  ThemeColor
//
//  Created by KyleRuan on 2017/12/27.
//  Copyright © 2017年 KyleRuan. All rights reserved.
//

import UIKit


public enum ThemeChangeError:Error {
    case EmptyColorList(String)
    case ColorConfigError(String)
    case ImagePrefixConfig(String)
    
}

private let current_theme_usertdefualt_key = "current_theme_usetdefualt_key"
public class ThemeManager: NSObject {
    private override init() {
        super.init()
        let type = UserDefaults.standard.integer(forKey: current_theme_usertdefualt_key)
        themeType = ThemeType(rawValue: type)
    }
    var themeType:ThemeType! {
        didSet {
            UserDefaults.standard.set(themeType.rawValue, forKey: current_theme_usertdefualt_key)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: kThemeUpdateNotification), object: nil)
        }
    }
    
    func getColorWith(color:TCColorName)  throws ->String {
        if self.colorList.isEmpty {
            self.colorList = kDefaultColorList
            if self.colorList.isEmpty {
                throw ThemeChangeError.EmptyColorList("color list not config please call setThemeColorList to config")
            }
        }
        
        if (self.colorList.count<=color.rawValue) {
            throw ThemeChangeError.ColorConfigError("colorList not match the TCColorName list")
        }
        let currentColors = self.colorList[color.rawValue]
        return currentColors[self.themeType.rawValue]
    }
    
    func getImageName(imageName:String)throws -> String  {
        
        if ThemeManager.sharedManager.themeType.rawValue == 0 {
            return imageName
        }
        
        if self.imagePrefixes.isEmpty {
            throw ThemeChangeError.ImagePrefixConfig("Image name prefixes not set please call  setThemeImagePrefix")
        } else if ThemeManager.sharedManager.themeType.rawValue >= imagePrefixes.count {
            throw ThemeChangeError.ImagePrefixConfig("Image name prefixes not set right ")
        }
        let prefix = self.imagePrefixes[ThemeManager.sharedManager.themeType.rawValue]
        return "\(prefix)_\(imageName)"

    }
    
    public static let sharedManager:ThemeManager = {
        let manager = ThemeManager()
        return manager
    }()
    
    public func switchTheme(type:ThemeType)  {
        self.themeType = type
    }
    
    public func switchThemeInTwoType()  {
        if self.themeType == .themeDay {
           self.themeType = .themeNight
        } else {
           self.themeType = .themeDay
        }
    }
    
    var colorList:[[String]] = []
    public func setThemeColorList(list:[[String]]) {
        self.colorList = list
    }
    fileprivate var imagePrefixes:[String] = []
    public func setThemeImagePrefix(imagePreArray:[String]) {
        self.imagePrefixes = imagePreArray
    }
    
    
}
