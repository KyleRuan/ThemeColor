//
//  UIViewTheme.swift
//  ThemeColor
//
//  Created by KyleRuan on 2017/12/27.
//  Copyright © 2017年 KyleRuan. All rights reserved.
//

import UIKit

public let kThemeUpdateNotification = "ThemeUpdateNotification"
fileprivate var themeDictKey = "themeDictKey"
fileprivate var backgroundColorKey = "backgroundColorKey"
fileprivate var themeChangeBlockKey = "themeChangeBlockKey"
fileprivate var borderColorKey = "borderColorKey"
public typealias ThemeClosure = (_ view:UIView,_ themeType:ThemeType) -> Void

public extension UIView {
     var themeDict:[String:ThemeClosure?]? {
        set {
            objc_setAssociatedObject(self,&themeDictKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }

        get {
            if let themeDict = objc_getAssociatedObject(self, &themeDictKey) as? [String:ThemeClosure]{
                return themeDict
            }
            let themeDict:[String:ThemeClosure] = [:]

            NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: kThemeUpdateNotification), object: nil, queue: nil) { [weak self]  noti in
                guard let weakSelf = self else {
                    return
                }

                weakSelf.themeDict?.forEach({ (key,closure) in
                    if let themeBlock = closure {
                        themeBlock(weakSelf , ThemeManager.sharedManager.themeType)
                    }
                })
            }
            objc_setAssociatedObject(self, &themeDictKey, themeDict, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            return themeDict
        }
    }
    
    /// do some theme change things e.g. NSAttributedString setting
    var tc_themeBlock:ThemeClosure? {
        set {
            self.themeDict?[themeChangeBlockKey] = newValue
            newValue?(self, ThemeManager.sharedManager.themeType)
            objc_setAssociatedObject(self, &themeChangeBlockKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            
        }
        get {
            return objc_getAssociatedObject(self,  &themeChangeBlockKey) as? ThemeClosure
        }
    }
    var tc_backgroundColor:TCColorName? {
        set {
            let themeClosure:ThemeClosure = {
                (view:UIView, themeType:ThemeType) -> Void in
                view.backgroundColor = UIColor(colorName: newValue)
            }
            
            self.themeDict?[backgroundColorKey] = themeClosure
            themeClosure(self, ThemeManager.sharedManager.themeType)
            objc_setAssociatedObject(self, &backgroundColorKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            
        }
        get {
            return objc_getAssociatedObject(self,  &backgroundColorKey) as? TCColorName
        }
        
    }
    
    var tc_borderColor:TCColorName? {
        set {
            let themeClosure:ThemeClosure = {
                (view:UIView, themeType:ThemeType) -> Void in
                view.layer.borderColor = UIColor(colorName: newValue)?.cgColor
            }
            
            self.themeDict?[borderColorKey] = themeClosure
            themeClosure(self, ThemeManager.sharedManager.themeType)
            objc_setAssociatedObject(self, &borderColorKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            
        }
        get {
            return objc_getAssociatedObject(self,  &borderColorKey) as? TCColorName
        }
        
    }
    
}

fileprivate var textColorKey = "textColorKey"
fileprivate var highlightedTextColorKey = "highlightedTextColorKey"
fileprivate var shadowColorKey = "shadowColorKey"

public extension UILabel {
    
    var tc_textColor:TCColorName? {
        set {
            let themeClosure:ThemeClosure = { [weak self]
                (view:UIView, themeType:ThemeType) -> Void in
                guard let weakSelf = self else {
                    return
                }
                weakSelf.textColor = UIColor(colorName: newValue)
            }
            
            self.themeDict?[textColorKey] = themeClosure
            themeClosure(self, ThemeManager.sharedManager.themeType)
            objc_setAssociatedObject(self, &textColorKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            
        }
        get {
            return objc_getAssociatedObject(self,  &textColorKey) as? TCColorName
        }
    }
    
    var tc_highlightedTextColor: TCColorName? {
        set {
            let themeClosure:ThemeClosure = { [weak self]
                (view:UIView, themeType:ThemeType) -> Void in
                guard let weakSelf = self else {
                    return
                }
                weakSelf.highlightedTextColor = UIColor(colorName: newValue)
            }
            
            self.themeDict?[highlightedTextColorKey] = themeClosure
            themeClosure(self, ThemeManager.sharedManager.themeType)
            objc_setAssociatedObject(self, &highlightedTextColorKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            
        }
        get {
            return objc_getAssociatedObject(self,  &highlightedTextColorKey) as? TCColorName
        }
        
        
    }
    var tc_shadowColor: TCColorName? {
        set {
            let themeClosure:ThemeClosure = { [weak self]
                (view:UIView, themeType:ThemeType) -> Void in
                guard let weakSelf = self else {
                    return
                }
                weakSelf.shadowColor = UIColor(colorName: newValue)
            }
            
            self.themeDict?[shadowColorKey] = themeClosure
            themeClosure(self, ThemeManager.sharedManager.themeType)
            objc_setAssociatedObject(self, &shadowColorKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            
        }
        get {
            return objc_getAssociatedObject(self,  &shadowColorKey) as? TCColorName
        }
        
    }
    
}

private var imageNameKey = "imageNameKey"
public extension UIImageView {
    var tc_imageName:String? {
        set {
            let themeClosure:ThemeClosure = { [weak self]
                (view:UIView, themeType:ThemeType) -> Void in
                guard let weakSelf = self else {
                    return
                }
                weakSelf.image = UIImage(themeName: newValue)
            }
            
            self.themeDict?[imageNameKey] = themeClosure
            themeClosure(self, ThemeManager.sharedManager.themeType)
            objc_setAssociatedObject(self, &imageNameKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            
        }
        get {
            return objc_getAssociatedObject(self,  &imageNameKey) as? String
        }
    }
    
}

fileprivate var setImageKey = "setImageKey"
fileprivate var setTitleColorKey = "setTitleColorKey"
fileprivate var setTitleShadowColorKey = "setTitleShadowColorKey"
fileprivate var setBackgroundImageKey = "setBackgroundImageKey"
public extension UIButton {
    // this will work for the name 
    func tc_setImage(_ imageName: String?, for state: UIControlState)  {
        self.setImage(UIImage(themeName: imageName), for: state)
        let themeClosure:ThemeClosure = { [weak self]
            (view:UIView, themeType:ThemeType) -> Void in
            guard let weakSelf = self else {
                return
            }
            weakSelf.setImage(UIImage(themeName:imageName), for: state)
        }
        let key = "\(state.rawValue)_\(setImageKey)"
        self.themeDict?[key] = themeClosure
        themeClosure(self, ThemeManager.sharedManager.themeType)
        
    }
    
    func tc_setTitleColor(_ color: TCColorName?, for state: UIControlState) {
        let themeClosure:ThemeClosure = { [weak self]
            (view:UIView, themeType:ThemeType) -> Void in
            guard let weakSelf = self else {
                return
            }
            weakSelf.setTitleColor(UIColor(colorName: color), for: state)
            
        }
        let key = "\(state.rawValue)_\(setTitleColorKey)"
        self.themeDict?[key] = themeClosure
        themeClosure(self, ThemeManager.sharedManager.themeType)
    }
    

    func tc_setTitleShadowColor(_ color: TCColorName?, for state: UIControlState) {
        let themeClosure:ThemeClosure = { [weak self]
            (view:UIView, themeType:ThemeType) -> Void in
            guard let weakSelf = self else {
                return
            }
            weakSelf.setTitleShadowColor(UIColor(colorName: color), for: state)
        }
        let key = "\(state.rawValue)_\(setTitleShadowColorKey)"
        self.themeDict?[key] = themeClosure
        themeClosure(self, ThemeManager.sharedManager.themeType)
        
    }
    
    func tc_setBackgroundImage(_ imageName: String?, for state: UIControlState) {
        let themeClosure:ThemeClosure = { [weak self]
            (view:UIView, themeType:ThemeType) -> Void in
            guard let weakSelf = self else {
                return
            }
            weakSelf.setBackgroundImage(UIImage(themeName:imageName), for: state)
        }
        let key = "\(state.rawValue)_\(setBackgroundImageKey)"
        self.themeDict?[key] = themeClosure
        themeClosure(self, ThemeManager.sharedManager.themeType)
    }
}

fileprivate var barTintColorKey = "barTintColorKey"
fileprivate var navigationBarTintColorKey = "navigationBarTintColorKey"

public extension UINavigationBar {
    var tc_barTintColor:TCColorName? {
        set {
            let themeClosure:ThemeClosure = { [weak self]
                (view:UIView, themeType:ThemeType) -> Void in
                guard let weakSelf = self else {
                    return
                }
                weakSelf.barTintColor = UIColor(colorName: newValue)
            }
            
            self.themeDict?[navigationBarTintColorKey] = themeClosure
            themeClosure(self, ThemeManager.sharedManager.themeType)
            objc_setAssociatedObject(self, &navigationBarTintColorKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self,  &navigationBarTintColorKey) as? TCColorName
        }
    }
    
    var tc_tintColor:TCColorName? {
        set {
            let themeClosure:ThemeClosure = { [weak self]
                (view:UIView, themeType:ThemeType) -> Void in
                guard let weakSelf = self else {
                    return
                }
                weakSelf.tintColor = UIColor(colorName: newValue)
            }
            
            self.themeDict?[barTintColorKey] = themeClosure
            themeClosure(self, ThemeManager.sharedManager.themeType)
            objc_setAssociatedObject(self, &barTintColorKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self,  &barTintColorKey) as? TCColorName
        }
    }
}

