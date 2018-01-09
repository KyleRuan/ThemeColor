//
//  UIImageExtension.swift
//  ThemeColor
//
//  Created by KyleRuan on 2018/1/7.
//  Copyright © 2018年 KyleRuan. All rights reserved.
//

import UIKit

extension UIImage {
    
    public convenience init?(themeName:String?) {
        guard let imageName = themeName else {
            return nil
        }
        
        var themedName = imageName
        do {
             themedName = try ThemeManager.sharedManager.getImageName(imageName: imageName)
        } catch let ThemeChangeError.ImagePrefixConfig(state) {
            print(state)
        }catch {
            print("unexpected error")
        }
        self.init(named: themedName)
    }

}
