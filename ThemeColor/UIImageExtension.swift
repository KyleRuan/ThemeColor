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
    
    func colorizeImage(colorName:TCColorName) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        guard let cgImage = self.cgImage else {
            return nil
        }
        guard let color = UIColor(colorName: colorName) else {
            return nil
        }
        
        let  area = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        context.scaleBy(x: 1, y: -1)
        context.translateBy(x: 0, y: -area.size.height)
        context.saveGState()
        context.clip(to: area, mask: cgImage)
        color.set()
        
        context.fill(area)
        context.restoreGState()
        context.setBlendMode(.multiply)
        
        context.draw(cgImage, in: area)
    
        
        let colorizedImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        return colorizedImage;
        
        
    }

}
